from .d_structuring_process import d_structuring_process
from .l_structuring_process import l_structuring_process
from .r_structuring_process import r_structuring_process
from .s_structuring_process import s_structuring_process

structuring_process_list = [d_structuring_process, l_structuring_process, r_structuring_process, s_structuring_process]
def saveStructuringProcesses(session):
    for structuring_process in structuring_process_list:
        session.add(structuring_process)
    session.commit()