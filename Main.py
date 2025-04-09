# -*- coding: utf-8 -*-


import numpy as np


def our_design_exact (Bit_Width, Parallel_deg, Input_number):
    Inp_value = int(Input_number*np.power(2, Bit_Width))
    #print ("Input_value", Inp_value)
    outp = np.zeros((Parallel_deg, int(np.power(2,Bit_Width)/Parallel_deg)), dtype=float, order='C')

    for i in range (len(outp[0])):
        if (Inp_value >= Parallel_deg):
            outp[:, i] = 1
            Inp_value-= Parallel_deg
        else:
            for ii in range (Parallel_deg):
                if(Inp_value > 0):
                    outp[ii, i] = 1
                    Inp_value -= 1
            break
    return outp



        
    