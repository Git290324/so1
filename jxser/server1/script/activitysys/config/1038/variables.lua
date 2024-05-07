EVENT_LOG_TITLE		= "EVENT_T9_2023"
DATE_END		= 20231202
--Nguy�n li�u d�ng �� gh�p v�t ph�m
--LONGDEN
ITEM_MATERIAL_BOX_DROP = {szName = "H�p v�t li�u l�ng ��n 2023", tbProp = {6,1,4388,1,0,0}}
ITEM_MATERIAL_1 = {szName = "Thanh tre 2023", tbProp = {6,1,4394,1,0,0}}
ITEM_MATERIAL_2 = {szName = "D�y c�i 2023", tbProp = {6,1,4395,1,0,0}}
ITEM_MATERIAL_3 = {szName = "N�n 2023", tbProp = {6,1,4396,1,0,0}}
ITEM_MATERIAL_4 = {szName = "Gi�y ki�ng v�ng 2023", tbProp = {6,1,4389,1,0,0}}
ITEM_MATERIAL_5 = {szName = "Gi�y ki�ng lam 2023", tbProp = {6,1,4390,1,0,0}}
ITEM_MATERIAL_6 = {szName = "Gi�y ki�ng l�c 2023", tbProp = {6,1,4391,1,0,0}}
ITEM_MATERIAL_7 = {szName = "Gi�y ki�ng �� 2023", tbProp = {6,1,4392,1,0,0}}
ITEM_MATERIAL_8 = {szName = "Gi�y ki�ng cam 2023", tbProp = {6,1,4393,1,0,0}}

DROP_BOX_RANDOM = 
{
	{szName = "H�p v�t li�u l�ng ��n 2023", tbProp = {6,1,4388,1,0,0}, nRate=0.5},
	{szName = "H�p v�t li�u l�ng ��n 2023", tbProp = {6,1,4388,1,0,0}, nRate=1.5},
}


TB_BOX_DROP = {
 
	{"Thanh tre 2023", 			4394,		20	},
	{"D�y c�i 2023",		4395,		20	},
	{"N�n 2023",	4396,		20	},
	{"Gi�y ki�ng v�ng 2023",		4389,		18	},
	{"Gi�y ki�ng lam 2023",	4390,		11	},
	{"Gi�y ki�ng l�c 2023",	4391,		5		},
	{"Gi�y ki�ng �� 2023",		4392,		1		},
	{"Gi�y ki�ng cam 2023",		4393,		1		},

}


--Tien van
MONEY		= {szName="Ng�n l��ng",nJxb=1}

--Ph�n th��ng gh�p
ITEM_AWARD_1		= {szName = "L�ng ��n b��m b��m 2023", tbProp = {6,1,4397,1,0,0}}
ITEM_AWARD_2		= {szName = "L�ng ��n ng�i sao 2023", tbProp = {6,1,4398,1,0,0}}
ITEM_AWARD_3		= {szName = "L�ng ��n �ng 2023", tbProp = {6,1,4399,1,0,0}}
ITEM_AWARD_4		= {szName = "L�ng ��n tr�n 2023", tbProp = {6,1,4400,1,0,0}}
ITEM_AWARD_5		= {szName = "L�ng ��n c� ch�p 2023", tbProp = {6,1,4401,1,0,0}}
ITEM_AWARD_6		= {szName = "L�ng ��n k�o qu�n 2023", tbProp = {6,1,4402,1,0,0}}

tbBITTSK_LIMIT_USE_BUOMBUOM = {nTaskID = 3998,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- Gi�i h�n d�ng long den buombuom
tbBITTSK_LIMIT_USE_BUOMBUOM_COUNT = {nTaskID = 4100,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} -- ��m s� l�n long den buombuom
tbTSK_INFO_BUOMBUOM_MOC10 = {nTaskID = 3998,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--M�c 10 long den buombuom
tbTSK_INFO_BUOMBUOM_MOC100 = {nTaskID = 3998,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 100 long den buombuom



tbBITTSK_LIMIT_USE_NGOISAO = {nTaskID = 3999,nStartBit = 1,nBitCount = 11,nMaxValue = 6000} 
tbBITTSK_LIMIT_USE_NGOISAO_COUNT = {nTaskID = 4101,nStartBit = 1,nBitCount = 16,nMaxValue = 6000} 
tbTSK_INFO_NGOISAO_MOC10 = {nTaskID = 3999,nStartBit = 25,nBitCount = 1,nMaxValue = 1}
tbTSK_INFO_NGOISAO_MOC100 = {nTaskID = 3999,nStartBit = 26,nBitCount = 1,nMaxValue = 1}



tbBITTSK_LIMIT_USE_ONG = {nTaskID = 4000,nStartBit = 1,nBitCount = 11,nMaxValue = 5000} 
tbBITTSK_LIMIT_USE_ONG_COUNT = {nTaskID = 4102,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} 
tbTSK_INFO_ONG_MOC10 = {nTaskID = 4000,nStartBit = 25,nBitCount = 1,nMaxValue = 1}
tbTSK_INFO_ONG_MOC100 = {nTaskID = 4000,nStartBit = 26,nBitCount = 1,nMaxValue = 1}


tbBITTSK_LIMIT_USE_TRON = {nTaskID = 4001,nStartBit = 1,nBitCount = 11,nMaxValue = 5000} 
tbBITTSK_LIMIT_USE_TRON_COUNT = {nTaskID = 4103,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} 
tbTSK_INFO_TRON_MOC10 = {nTaskID = 4001,nStartBit = 25,nBitCount = 1,nMaxValue = 1}
tbTSK_INFO_TRON_MOC100 = {nTaskID = 4001,nStartBit = 26,nBitCount = 1,nMaxValue = 1}


tbBITTSK_LIMIT_USE_CACHEP = {nTaskID = 4002,nStartBit = 1,nBitCount = 11,nMaxValue = 5000} 
tbBITTSK_LIMIT_USE_CACHEP_COUNT = {nTaskID = 4104,nStartBit = 1,nBitCount = 16,nMaxValue = 5000} 
tbTSK_INFO_CACHEP_MOC10 = {nTaskID = 4002,nStartBit = 25,nBitCount = 1,nMaxValue = 1}
tbTSK_INFO_CACHEP_MOC100 = {nTaskID = 4002,nStartBit = 25,nBitCount = 1,nMaxValue = 1}

tbBITTSK_LIMIT_GIVE_KEOQUAN = {nTaskID = 4003,	nStartBit = 1, nBitCount = 4, nMaxValue = 3} --max tang long den keo quan - no xai

nTask_ItemScript_KQ = 4952   		--Task ID -> S� l��ng m� ng��i ch�i n�p long den kq
nLimit_LongDen_KQ = 5000
