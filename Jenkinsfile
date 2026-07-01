/**
 * Natur i Norge — macOS mobile CI (Jenkins)
 *
 * Runs on the dedicated Mac worker (label: mbp-m2p) with Flutter, Android SDK,
 * Xcode simulators, and (for deploy) signing material already on the agent or
 * supplied via Jenkins credentials.
 *
 * This pipeline intentionally does NOT call ./publish.sh for screenshots or
 * tests: publish.sh always runs store deploy after --screenshots. Use the
 * scripts/ helpers directly (same as publish.sh uses internally).
 *
 * ── Jenkins credentials (create in Jenkins → Credentials) ─────────────────
 *
 *   natur-i-norge-dotenv
 *     Secret file — copy of .env (FASTLANE_USER, FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD, …)
 *     Required for: deploy iOS/Android only
 *
 *   HashiCorp Vault path: secret/android/natur-i-norge
 *     Contains key_alias, key_password, keystore_base64, store_password.
 *     Fetched dynamically during build for Android signing.
 *
 *   natur-i-norge-google-play-json
 *     Secret file — Google Play service account JSON
 *     Install path must match fastlane/Appfile json_key_file (under .secrets/AndroidKeys/)
 *     Required for: fastlane android deploy / metadata
 *
 *   natur-i-norge-github-push  (optional, web deploy job only)
 *     SSH private key or username/password with push access to geco-nhm/natur-i-norge
 *
 * iOS signing: distribution cert + provisioning profiles are expected in the
 * mbp-m2p login keychain (or Xcode automatic signing). Jenkins file credentials
 * are awkward for Apple; keep the Mac agent as the trust boundary.
 *
 * Web / GitHub Pages: use a separate Jenkins job (see Jenkinsfile.web) so
 * commits to main/docs are not tied to every mobile build.
 */

pipeline {
  agent { label 'mbp-m2p' }

  options {
    disableConcurrentBuilds()
    timeout(time: 3, unit: 'HOURS')
    buildDiscarder(logRotator(numToKeepStr: '30'))
  }

  parameters {
    booleanParam(name: 'RUN_ANDROID_INTEGRATION', defaultValue: true,
      description: 'Run observation flow integration test on Android emulator')
    booleanParam(name: 'RUN_ANDROID_SCREENSHOTS', defaultValue: true,
      description: 'Generate Play Store screenshots (3 AVDs, ~30–60 min)')
    booleanParam(name: 'RUN_IOS_SCREENSHOTS', defaultValue: true,
      description: 'Generate App Store screenshots (3 simulators)')
    booleanParam(name: 'BUILD_ANDROID', defaultValue: true,
      description: 'flutter build appbundle + apk --release')
    booleanParam(name: 'BUILD_IOS', defaultValue: true,
      description: 'flutter build ipa --release')
    booleanParam(name: 'DEPLOY_ANDROID', defaultValue: false,
      description: 'Upload to Play internal track via fastlane (needs all Android secrets)')
    booleanParam(name: 'DEPLOY_IOS', defaultValue: false,
      description: 'Upload to TestFlight via fastlane (needs .env + keychain signing)')
    booleanParam(name: 'ARCHIVE_SCREENSHOTS', defaultValue: true,
      description: 'Stash screenshot PNGs as Jenkins artifacts')
  }

  environment {
    LANG = 'en_US.UTF-8'
    LC_ALL = 'en_US.UTF-8'
    JAVA_HOME = '/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home'
    ANDROID_HOME = "${env.HOME}/Library/Android/sdk"
    ANDROID_SDK_ROOT = "${env.HOME}/Library/Android/sdk"
    PATH = "/opt/homebrew/opt/ruby/bin:/opt/homebrew/opt/openjdk@17/bin:${env.HOME}/Library/Android/sdk/cmdline-tools/latest/bin:${env.HOME}/Library/Android/sdk/platform-tools:${env.HOME}/Library/Android/sdk/emulator:/opt/homebrew/bin:/usr/local/bin:${env.PATH}"
    // Must match fastlane/Appfile json_key_file basename
    PLAY_JSON_BASENAME = 'api-7365211286744298322-1762-e99cbc1803f2.json'
    VAULT_ADDR = 'https://vault.gimli.lan'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Dependencies') {
      steps {
        sh '''
          set -e
          flutter --version
          flutter pub get
          bundle config set --local path vendor/bundle
          bundle install
        '''
      }
    }

    stage('Android integration test') {
      when { expression { return params.RUN_ANDROID_INTEGRATION } }
      steps {
        sh './scripts/run_android_observation_flow_test.sh'
      }
    }

    // Sequential: both use heavy emulators/simulators and share the host GPU.
    stage('Android screenshots') {
      when { expression { return params.RUN_ANDROID_SCREENSHOTS } }
      steps {
        sh './scripts/automate_screenshots.sh'
      }
    }

    stage('iOS screenshots') {
      when { expression { return params.RUN_IOS_SCREENSHOTS } }
      steps {
        sh './scripts/automate_ios_screenshots.sh'
      }
    }

    stage('Release builds') {
      when {
        anyOf {
          expression { return params.BUILD_ANDROID }
          expression { return params.BUILD_IOS }
        }
      }
      steps {
        script {
          def needsAndroidSecrets = params.BUILD_ANDROID || params.DEPLOY_ANDROID
          def needsEnv = params.DEPLOY_ANDROID || params.DEPLOY_IOS

          if (needsAndroidSecrets || needsEnv) {
            withMobileSecrets(
              installAndroidSigning: needsAndroidSecrets,
              installDotenv: needsEnv,
              installPlayJson: params.DEPLOY_ANDROID
            ) {
              runReleaseBuilds()
            }
          } else {
            runReleaseBuilds()
          }
        }
      }
    }

    stage('Deploy stores') {
      when {
        anyOf {
          expression { return params.DEPLOY_ANDROID }
          expression { return params.DEPLOY_IOS }
        }
      }
      steps {
        script {
          withMobileSecrets(
            installAndroidSigning: params.DEPLOY_ANDROID,
            installDotenv: true,
            installPlayJson: params.DEPLOY_ANDROID
          ) {
            if (params.DEPLOY_ANDROID) {
              sh 'bundle exec fastlane android deploy'
            }
            if (params.DEPLOY_IOS) {
              sh '''
                cd ios && pod install
                bundle exec fastlane ios deploy
              '''
            }
          }
        }
      }
    }
  }

  post {
    always {
      script {
        if (params.ARCHIVE_SCREENSHOTS) {
          archiveArtifacts artifacts: 'fastlane/metadata/android/no-NO/images/**/*.png,fastlane/screenshots/ios/**/*.png',
            allowEmptyArchive: true,
            fingerprint: true
        }
        archiveArtifacts artifacts: 'build/app/outputs/bundle/release/*.aab,build/app/outputs/flutter-apk/app-release.apk,build/ios/ipa/*.ipa',
          allowEmptyArchive: true,
          fingerprint: true
      }
    }
    success {
      echo '✅ Pipeline finished successfully'
    }
    failure {
      echo '❌ Pipeline failed — check emulator/simulator logs and Gradle/Xcode output above'
    }
  }
}

/** Install secret files from Jenkins credentials and Vault into the workspace layout publish.sh expects. */
void withMobileSecrets(Map config, Closure body) {
  def creds = []
  if (config.installDotenv) {
    creds << file(credentialsId: 'natur-i-norge-dotenv', variable: 'DOTENV_FILE')
  }
  if (config.installPlayJson) {
    creds << file(credentialsId: 'natur-i-norge-google-play-json', variable: 'PLAY_JSON_FILE')
  }

  def runWithAndroidSigning = {
    if (config.installAndroidSigning) {
      sh '''
        set -e
        echo "🔑 Fetching Android signing keys from Vault..."
        mkdir -p android

        # Find or download Vault CLI
        if command -v vault >/dev/null 2>&1; then
          VAULT_BIN="vault"
        else
          echo "⚠️ vault CLI not found in PATH, downloading dynamically..."
          python3 -c "import urllib.request; urllib.request.urlretrieve('https://releases.hashicorp.com/vault/1.17.2/vault_1.17.2_darwin_arm64.zip', 'vault.zip')"
          python3 -m zipfile -e vault.zip .
          chmod +x vault
          VAULT_BIN="./vault"
          rm -f vault.zip
        fi

        $VAULT_BIN read -format=json secret/data/android/natur-i-norge | python3 -c '
import sys, json, base64
data = json.load(sys.stdin)["data"]["data"]
sp = data["store_password"]
kp = data["key_password"]
ka = data["key_alias"]
with open("android/key.properties", "w") as f:
    print(f"storePassword={sp}", file=f)
    print(f"keyPassword={kp}", file=f)
    print(f"keyAlias={ka}", file=f)
    print("storeFile=../natur-i-norge.keystore", file=f)
with open("android/natur-i-norge.keystore", "wb") as f:
    f.write(base64.b64decode(data["keystore_base64"]))
'

        # Clean up dynamic vault binary if downloaded
        if [ "$VAULT_BIN" = "./vault" ]; then
          rm -f ./vault
        fi
      '''
    }
    body()
  }

  if (creds.isEmpty()) {
    runWithAndroidSigning()
    return
  }

  withCredentials(creds) {
    sh """
      set -e
      if [ -n "\${DOTENV_FILE:-}" ]; then
        cp "\$DOTENV_FILE" .env
        set -a
        . ./.env
        set +a
      fi
      if [ -n "\${PLAY_JSON_FILE:-}" ]; then
        mkdir -p ".secrets/AndroidKeys"
        cp "\$PLAY_JSON_FILE" ".secrets/AndroidKeys/${env.PLAY_JSON_BASENAME}"
      fi
    """
    runWithAndroidSigning()
  }
}

void runReleaseBuilds() {
  if (params.BUILD_ANDROID) {
    sh '''
      set -e
      flutter build appbundle --release
      flutter build apk --release
    '''
  }
  if (params.BUILD_IOS) {
    sh '''
      set -e
      cd ios && pod install
      cd ..
      flutter build ipa --release
    '''
  }
}
