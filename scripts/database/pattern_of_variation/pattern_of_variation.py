from .f_pattern_of_variation import f_pattern_of_variation
from .g_pattern_of_variation import g_pattern_of_variation
from .ga_pattern_of_variation import ga_pattern_of_variation
from .gs_pattern_of_variation import gs_pattern_of_variation
from .t_pattern_of_variation import t_pattern_of_variation
from .mf_pattern_of_variation import mf_pattern_of_variation

pattern_of_variation_list = [f_pattern_of_variation,g_pattern_of_variation,ga_pattern_of_variation,gs_pattern_of_variation,t_pattern_of_variation,mf_pattern_of_variation]

def savePatternsOfVariation(session):
    for pattern_of_variation in pattern_of_variation_list:
        session.add(pattern_of_variation)
    session.commit()