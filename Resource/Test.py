

def scale(num,l,r,ll,rr):
    ddel = rr-ll
    dell = r-l

    return (num-l)/dell*ddel+ll



def NumStageColor(st):
	if st < 10:
		return (0.1,1,scale(st,1,10,0.3,1),1)
	elif st < 15:
		return (0.1,scale(st,10,15,1,0.3),1,1)
	elif st < 20:
		return (scale(st,15,20,0.1,1),0.3,1,1)
	elif st < 30:
		return (1,0.3,scale(st,20,30,1,0.3),1)
	else:
		return (1,0.3,0.3,1);

def SMCL2HTML(CL):
    STR = ""
    for i in CL:
        STR+=hex(int(i*255))[2:]

    return STR[:-2]

print(SMCL2HTML(NumStageColor(6)))



