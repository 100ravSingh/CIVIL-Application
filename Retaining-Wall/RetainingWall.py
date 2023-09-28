#!/usr/bin/env python
# coding: utf-8

# ## Q. Design a cantilever retaining wall to retain the Earth of height 5.5m above lower 
# ## ground level.Fix the basic dimensions and carryout the stability checks of retaining wall.
# #### given datas are-
# #### SBC=175KPA
# #### meu=0.5
# #### Angle of internal friction = 30 degree
# #### unit_soil= 18KN/m3
# #### RCC_unit=25KN/m3
# #### M20 and Fe415

import math as mt
import numpy as np

#Data Inputs
SBC=float(input("Enter the soil bearing capacity of soil in KPa "))
phi=float(input("Enter the angle of internal friction of soil in degree "))
mew=float(input("Enter the friction coefficient of soil "))
unit_soil=float(input("Enter the unit weight of soil in KN/m3 "))
unit_RCC=25
fck=20 # grade of concrete which canbe change by users requirment
fe=415 #grade of steel which canbe change by users requirment
H=float(input("Enter height of the wall above the ground in m \n"))
count=0

#Calculation of coefficient of Earth Pressure
Ka=(1-np.sin(phi*mt.pi/180))/(1+np.sin(phi*mt.pi/180))
Kp=1/Ka
print("Active earth pressure coefficient {:.2f} and passive earth pressure coefficient is {} \n".format(Ka,Kp))
      
#Preliminary Dimensions
      
#Minimum_Depth
d_min=round((SBC/unit_soil)*(Ka**2),1)
print("provided depth of foundation is {} m ".format(d_min))
def D_min(d_min):
    HH=d_min+H
    return HH
OH=D_min(d_min)

print("Overall height of wall is {} m".format(OH))
      
#Base_Width
def Base_width(OH):
    P=0.5*Ka*unit_soil*(OH**2) #active lateral force
    min=round(mt.sqrt((3*P)/(2*unit_soil)),1)
    return min

b_min=Base_width(OH)

def Toe_width(b_min):
    Toe_width=round(Base_width(OH)/3,1)
    return Toe_width

Te_width=Toe_width(b_min)
print("Base width of stem {} m and toe width is {} m".format(Base_width(OH),Te_width))
      
#Thickness of base slab
def base_slab(OH):
    Th1=round((OH*((1/12)+(1/15))/2),1)
    return Th1

Th=base_slab(OH)
print("Uniform thickness of base slab is {} m".format(base_slab(OH)))
      
#Thickness of stem at base
def stem_base(OH):
    Pa=Ka*unit_soil*(OH-base_slab(OH)) #active lateral pressure at stem of base
    Mu=1.5*(0.5*Ka*unit_soil*(OH-base_slab(OH))**3)/3 #maximum moment at the base of stem
    D_stem=round(mt.sqrt(Mu/(0.138*1000*fck))+0.05,1) #this is only for Fe 415 steel bars
    return D_stem

d_stem=stem_base(OH)
print("Total width of stem base per metre is {} m".format(d_stem))
      
#Width of Heel
def width_heel(b_min,d_min,d_stem):
    wx_heel=round(b_min-d_min-d_stem,1)
    return wx_heel
      
w_heel=width_heel(b_min,d_min,d_stem)
tt_stem=float(input("take value from 0.15m to 0.45m "))

def thick_stem(X):
    t2_stem=X
    return t2_stem

T_stem=thick_stem(tt_stem)
print("width of heel is {} m and top stem width is {} m".format(w_heel , T_stem))
print("Shear key is provided of size {}m*{}m below base to prevent sliding of the wall".format(Th,d_stem))
      
#Horizontal active pressure at the base of the wall in KN/m2 if wall length is 1m
def H_pressure(OH):
    Ph1=round((Ka*unit_soil*OH),1)
    return Ph1

Ph=H_pressure(OH)
print("Horizontal active pressure at the base of wall is {} KN/m2 \n".format(Ph))
      
#Stability Check
      
#Horizontal force calculation
#Moment about toe due to active earth pressure
def Moment(OH):
    HL=round((0.5*Ph*OH),1) #Horizontal load in KN
    Lh=OH/3 #Perpendicular distance from toe
    Mt1=round(HL*Lh,1)
    return Mt1

Mt=Moment(OH)
P=0.5*Ka*unit_soil*(OH**2)
SF=round(0.5*Ka*unit_soil*(OH**2),1) #Sliding force in KN
print("Overturning Moment about toe {} KNm anticlockwise and Sliding force is {} KNleft to right".format(Moment(OH),SF))
      
#Vertical Load Calculation
def vertical(OH):
    S_w1=unit_RCC*T_stem*(OH-Th) #stem-w1
    La1=Toe_width(b_min)+(d_stem-T_stem)+(T_stem/2) #perpendicular distance from A
    S_w2=0.5*unit_RCC*(OH-Th)*(d_stem-T_stem) #stem-w2
    La2=Toe_width(b_min)+(2/3)*(d_stem-T_stem)
    S_w3=(unit_RCC*(Base_width(OH)*Th)) #stem-w3
    La3=(Base_width(OH)/2)
    S_w4=(Th*d_stem*unit_RCC) #Shear key vertical load
    La4=(Toe_width(b_min)+(d_stem)/2)
    S_w5=(w_heel*(OH-Th)*unit_soil) #Backfill vertical force
    La5=(Toe_width(b_min)+d_stem+(w_heel/2))
    SW1=S_w1+S_w2+S_w3+S_w4+S_w5 #net vertical load
    return SW1

SW=vertical(OH)

def Restoring_moment():
    Mw1=round(unit_RCC*T_stem*(OH-Th)*(Toe_width(b_min)+(d_stem-T_stem)+(T_stem/2)),1)

    #moment about toe
    Mw2=round((0.5*unit_RCC*(OH-Th)*(d_stem-T_stem))*(Toe_width(b_min)+(2/3)*(d_stem-T_stem)),1)
    Mw3=round((unit_RCC*(Base_width(OH)*Th))*(Base_width(OH)/2),1)
    Mw4=round((Th*d_stem*unit_RCC)*(Toe_width(b_min)+(d_stem)/2),1)
    Mw5=round((w_heel*(OH-Th)*unit_soil)*(Toe_width(b_min)+d_stem+(w_heel/2)),1)
    RM1=Mw1+Mw2+Mw3+Mw4+Mw5 #Restoring Moment
    return RM1
RM=Restoring_moment()
      
#print("Restoring moment due to stem 1 is {} KNm clockwise".format(Mw1))
#print("Restoring moment due to stem 2 is {} KNm clockwise".format(Mw2))
#print("Restoring moment due to stem 3 is {} KNm clockwise".format(Mw3))
#print("Restoring moment due to shear key is {} KNm clockwise".format(Mw4))
#print("Restoring moment due to backfill is {} KNm clockwise".format(Mw5))
      
print("net restoring moment is {} KNm clockwise".format(Restoring_moment()))
print("Net verical loads is {} KN downward".format(vertical(OH)))

def redesign(d_min):
    OH=D_min(d_min)
    b_min=Base_width(OH)
    Te_width=Toe_width(b_min)
    Th=base_slab(OH)
    d_stem=stem_base(OH)
    w_heel=width_heel(b_min,d_min,d_stem)
    T_stem=thick_stem(tt_stem)
    Ph=H_pressure(OH)
    Mt=Moment(OH)
    SW=vertical(OH)
    RM=Restoring_moment()
    CG1=CG()
    RF=Rforce(Th,d_stem)
    return [OH,b_min,Te_width,Th,d_stem,w_heel,T_stem,Ph,Mt,SW,RM,CG1,RF]

#CG Calculation
def CG():
    CG=(RM-Mt)/SW
    return CG

CG1=CG()
print("CG of vertical loads from the face of the toe is {:.2f} m".format(CG1))

#Eccentricity Calculation
e=(b_min/2)-CG1
print("eccentricity value is {:.2f} m".format(e))

#Pressure calculation
Y=[OH,b_min,Te_width,Th,d_stem,w_heel,T_stem,Ph,Mt,SW,RM,CG1]
Pmax=(SW/Y[1]*(1+(6*e/Y[1]))) #maximum pressure at toe
while (Pmax<SBC):
    Pmax=(SW/Y[1])*(1+(6*e/Y[1])) #maximum pressure at toe
    if Pmax<SBC:
        print("Toe pressure within safe value {:.2f} KN/m2 ".format(Pmax))
        break
    else:
        d_min+=0.1
        count=count+1
        Y=redesign(d_min)
Pmin=(SW/Y[1])*(1-(6*e/Y[1])) #minimum pressure at heel
if Pmin>0:
    print("Heel pressure {:.2f} KN/m2 is non negative hence no tension at base".format(Pmin))
else:
    print("Heel pressure {:.2f} KN/m2 is negative hence tension at base".format(Pmin))
#Factor of Safety

# FOS against overturning
FOS=RM/Mt
while (FOS<1.55):
    d_min=d_min+0.1
    Y=redesign(d_min)
    count=count+1
    FOS=Y[-2]/Mt
print("FOS against overturning is {:.2f} > 1.55 hence safe against overturning".format(FOS))
      
#FOS against Sliding force
FF=mew*SW #friction force

def Rforce(Th,d_stem):
    Pp=Kp*unit_soil*(Th+d_stem) # Passive earth pressure
    Fpp=0.5*Pp*(Th+d_stem) #Passive earth force
    RF1= FF+Fpp #total restoring force
    return RF1

RF=Rforce(Th,d_stem)
FOS_2=RF/P
Y.insert(-1,RF)

while (FOS_2<1.55):
    d_min=d_min+0.1
    Y=redesign(d_min)
    count=count+1
    FOS_2=(Y[-1]/P)
print("FOS against sliding is {:.2f} > 1.55 hence safe against sliding \n".format(FOS_2))
      
#Trails Count
print("Number of trails taken by system is {} times \n".format(count))

#dimensions
print("Design dimensions are")
print("design depth of foundation is {:.2f} m ".format(d_min))
print("Overall height of wall is {:.2f} m".format(Y[0]))
print("Base width of stem {:.2f} m and toe width is {:.2f} m".format(Y[1],Y[2]))
print("Uniform thickness of base slab is {:.2f} m".format(Y[3]))
print("Total width of stem base per metre is {:.2f} m".format(Y[4]))
print("width of heel is {:.2f} m and top stem width is {:.2f} m".format(w_heel,Y[6]))
print("Shear key is provided of size {:.2f}m*{:.2f}m below base to prevent sliding of the wall".format(Y[3],Y[4]))

