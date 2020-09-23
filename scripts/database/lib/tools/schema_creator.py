# %%
import sadisplay
import codecs
import subprocess

def create_schema(model):
    desc = sadisplay.describe(

        [getattr(model, attr) for attr in dir(model)],
        show_methods=True,
        show_properties=True,
        show_indexes=True,
    )
    with codecs.open('schema.dot', 'w', encoding='utf-8') as f:
        f.write(sadisplay.dot(desc))

    subprocess.getoutput('dot -Tpng schema.dot > schema.png')

# %%
