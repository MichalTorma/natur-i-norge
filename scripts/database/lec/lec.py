# %%
from .as_lec import as_lec
from .bk_lec import bk_lec
from .dd_lec import dd_lec
from .dl_lec import dl_lec
from .dm_lec import dm_lec
from .er_lec import er_lec
from .fk_lec import fk_lec
from .fr_lec import fr_lec
from .gs_lec import gs_lec
from .hf_lec import hf_lec
from .hi_lec import hi_lec
from .hr_lec import hr_lec
from .hs_lec import hs_lec
from .hu_lec import hu_lec
from .if_lec import if_lec
from .io_lec import io_lec
from .jf_lec import jf_lec
from .jv_lec import jv_lec
from .ka_lec import ka_lec
from .ki_lec import ki_lec
from .ko_lec import ko_lec
from .kt_lec import kt_lec
from .ky_lec import ky_lec
from .la_lec import la_lec
from .lk_lec import lk_lec
from .mb_lec import mb_lec
from .mf_lec import mf_lec
from .mx_lec import mx_lec
from .ng_lec import ng_lec
from .of_lec import of_lec
from .om_lec import om_lec
from .or_lec import or_lec
from .pf_lec import pf_lec
from .ru_lec import ru_lec
from .s1_lec import s1_lec
from .s3_lec import s3_lec
from .s3e_lec import s3e_lec
from .s3f_lec import s3f_lec
from .s3s_lec import s3s_lec
from .sa_lec import sa_lec
from .se_lec import se_lec
from .sf_lec import sf_lec
from .sh_lec import sh_lec
from .sm_lec import sm_lec
from .sp_lec import sp_lec
from .ss_lec import ss_lec
from .su_lec import su_lec
from .sv_lec import sv_lec
from .sx_lec import sx_lec
from .sy_lec import sy_lec
from .te_lec import te_lec
from .tu_lec import tu_lec
from .tv_lec import tv_lec
from .ue_lec import ue_lec
from .uf_lec import uf_lec
from .vf_lec import vf_lec
from .vi_lec import vi_lec
from .vm_lec import vm_lec
from .vr_lec import vr_lec
from .vs_lec import vs_lec
from .vt_lec import vt_lec

lec_list = [as_lec, bk_lec, dd_lec, dl_lec, dm_lec, er_lec, fk_lec, fr_lec, gs_lec, hf_lec, hi_lec, hr_lec, hs_lec, hu_lec, if_lec, io_lec, jf_lec, jv_lec, ka_lec, ki_lec, ko_lec, kt_lec, ky_lec, la_lec, lk_lec, mb_lec, mf_lec, mx_lec, ng_lec, of_lec, om_lec, or_lec, pf_lec, ru_lec, s1_lec, s3_lec, s3e_lec, s3f_lec, s3s_lec, sa_lec, se_lec, sf_lec, sh_lec, sm_lec, sp_lec, ss_lec, su_lec, sv_lec, sx_lec, sy_lec, te_lec, tu_lec, tv_lec, ue_lec, uf_lec, vf_lec, vi_lec, vm_lec, vr_lec, vs_lec, vt_lec
            ]


def saveLec(session):
    for lec in lec_list:

        session.add(lec)
    session.commit()

# %%
