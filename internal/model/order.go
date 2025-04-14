package model

import "encoding/xml"

type EDIFACT struct {
    XMLName xml.Name `xml:"EDIFACT"`
    UNB UNB `xml:"UNB"`
    UNZ UNZ `xml:"UNZ,omitempty"`
}

// ORDERS Purchase order message
type ORDERS struct {
    XMLName xml.Name `xml:"ORDERS"`
    UNH UNH `xml:"UNH"`
    BGM BGM `xml:"BGM"`
    DTM []DTM `xml:"DTM"`
    PAI PAI `xml:"PAI,omitempty"`
    ALI []ALI `xml:"ALI,omitempty"`
    IMD IMD `xml:"IMD,omitempty"`
    FTX []FTX `xml:"FTX,omitempty"`
    GROUP_1 []GROUP_1 `xml:"GROUP_1,omitempty"`
    GROUP_2 []GROUP_2 `xml:"GROUP_2,omitempty"`
    GROUP_6 []GROUP_6 `xml:"GROUP_6,omitempty"`
    GROUP_7 []GROUP_7 `xml:"GROUP_7,omitempty"`
    GROUP_8 []GROUP_8 `xml:"GROUP_8,omitempty"`
    GROUP_9 []GROUP_9 `xml:"GROUP_9,omitempty"`
    GROUP_11 []GROUP_11 `xml:"GROUP_11,omitempty"`
    GROUP_12 []GROUP_12 `xml:"GROUP_12,omitempty"`
    GROUP_14 []GROUP_14 `xml:"GROUP_14,omitempty"`
    GROUP_15 []GROUP_15 `xml:"GROUP_15,omitempty"`
    GROUP_17 []GROUP_17 `xml:"GROUP_17,omitempty"`
    GROUP_18 []GROUP_18 `xml:"GROUP_18,omitempty"`
    GROUP_24 []GROUP_24 `xml:"GROUP_24,omitempty"`
    GROUP_25 []GROUP_25 `xml:"GROUP_25,omitempty"`
    UNS UNS `xml:"UNS"`
    MOA []MOA `xml:"MOA,omitempty"`
    CNT []CNT `xml:"CNT,omitempty"`
    GROUP_54 []GROUP_54 `xml:"GROUP_54,omitempty"`
    UNT UNT `xml:"UNT"`
}

type GROUP_1 struct {
    XMLName xml.Name `xml:"GROUP_1"`
    RFF RFF `xml:"RFF"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_2 struct {
    XMLName xml.Name `xml:"GROUP_2"`
    NAD NAD `xml:"NAD"`
    LOC []LOC `xml:"LOC,omitempty"`
    FII []FII `xml:"FII,omitempty"`
    GROUP_3 []GROUP_3 `xml:"GROUP_3,omitempty"`
    GROUP_4 []GROUP_4 `xml:"GROUP_4,omitempty"`
    GROUP_5 []GROUP_5 `xml:"GROUP_5,omitempty"`
}

type GROUP_3 struct {
    XMLName xml.Name `xml:"GROUP_3"`
    RFF RFF `xml:"RFF"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_4 struct {
    XMLName xml.Name `xml:"GROUP_4"`
    DOC DOC `xml:"DOC"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_5 struct {
    XMLName xml.Name `xml:"GROUP_5"`
    CTA CTA `xml:"CTA"`
    COM []COM `xml:"COM,omitempty"`
}

type GROUP_6 struct {
    XMLName xml.Name `xml:"GROUP_6"`
    TAX TAX `xml:"TAX"`
    MOA MOA `xml:"MOA,omitempty"`
    LOC []LOC `xml:"LOC,omitempty"`
}

type GROUP_7 struct {
    XMLName xml.Name `xml:"GROUP_7"`
    CUX CUX `xml:"CUX"`
    PCD []PCD `xml:"PCD,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_8 struct {
    XMLName xml.Name `xml:"GROUP_8"`
    PAT PAT `xml:"PAT"`
    DTM []DTM `xml:"DTM,omitempty"`
    PCD PCD `xml:"PCD,omitempty"`
    MOA MOA `xml:"MOA,omitempty"`
}

type GROUP_9 struct {
    XMLName xml.Name `xml:"GROUP_9"`
    TDT TDT `xml:"TDT"`
    GROUP_10 []GROUP_10 `xml:"GROUP_10,omitempty"`
}

type GROUP_10 struct {
    XMLName xml.Name `xml:"GROUP_10"`
    LOC LOC `xml:"LOC"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_11 struct {
    XMLName xml.Name `xml:"GROUP_11"`
    TOD TOD `xml:"TOD"`
    LOC []LOC `xml:"LOC,omitempty"`
}

type GROUP_12 struct {
    XMLName xml.Name `xml:"GROUP_12"`
    PAC PAC `xml:"PAC"`
    MEA []MEA `xml:"MEA,omitempty"`
    GROUP_13 []GROUP_13 `xml:"GROUP_13,omitempty"`
}

type GROUP_13 struct {
    XMLName xml.Name `xml:"GROUP_13"`
    PCI PCI `xml:"PCI"`
    RFF RFF `xml:"RFF,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
    GIN []GIN `xml:"GIN,omitempty"`
}

type GROUP_14 struct {
    XMLName xml.Name `xml:"GROUP_14"`
    EQD EQD `xml:"EQD"`
    HAN []HAN `xml:"HAN,omitempty"`
    MEA []MEA `xml:"MEA,omitempty"`
    FTX []FTX `xml:"FTX,omitempty"`
}

type GROUP_15 struct {
    XMLName xml.Name `xml:"GROUP_15"`
    SCC SCC `xml:"SCC"`
    FTX []FTX `xml:"FTX,omitempty"`
    RFF []RFF `xml:"RFF,omitempty"`
    GROUP_16 []GROUP_16 `xml:"GROUP_16,omitempty"`
}

type GROUP_16 struct {
    XMLName xml.Name `xml:"GROUP_16"`
    QTY QTY `xml:"QTY"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_17 struct {
    XMLName xml.Name `xml:"GROUP_17"`
    APR APR `xml:"APR"`
    DTM []DTM `xml:"DTM,omitempty"`
    RNG RNG `xml:"RNG,omitempty"`
}

type GROUP_18 struct {
    XMLName xml.Name `xml:"GROUP_18"`
    ALC ALC `xml:"ALC"`
    ALI []ALI `xml:"ALI,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
    GROUP_19 GROUP_19 `xml:"GROUP_19,omitempty"`
    GROUP_20 GROUP_20 `xml:"GROUP_20,omitempty"`
    GROUP_21 []GROUP_21 `xml:"GROUP_21,omitempty"`
    GROUP_22 GROUP_22 `xml:"GROUP_22,omitempty"`
    GROUP_23 []GROUP_23 `xml:"GROUP_23,omitempty"`
}

type GROUP_19 struct {
    XMLName xml.Name `xml:"GROUP_19"`
    QTY QTY `xml:"QTY"`
    RNG RNG `xml:"RNG,omitempty"`
}

type GROUP_20 struct {
    XMLName xml.Name `xml:"GROUP_20"`
    PCD PCD `xml:"PCD"`
    RNG RNG `xml:"RNG,omitempty"`
}

type GROUP_21 struct {
    XMLName xml.Name `xml:"GROUP_21"`
    MOA MOA `xml:"MOA"`
    RNG RNG `xml:"RNG,omitempty"`
}

type GROUP_22 struct {
    XMLName xml.Name `xml:"GROUP_22"`
    RTE RTE `xml:"RTE"`
    RNG RNG `xml:"RNG,omitempty"`
}

type GROUP_23 struct {
    XMLName xml.Name `xml:"GROUP_23"`
    TAX TAX `xml:"TAX"`
    MOA MOA `xml:"MOA,omitempty"`
}

type GROUP_24 struct {
    XMLName xml.Name `xml:"GROUP_24"`
    RCS RCS `xml:"RCS"`
    RFF []RFF `xml:"RFF,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
    FTX []FTX `xml:"FTX,omitempty"`
}

type GROUP_25 struct {
    XMLName xml.Name `xml:"GROUP_25"`
    LIN LIN `xml:"LIN"`
    PIA []PIA `xml:"PIA,omitempty"`
    IMD []IMD `xml:"IMD,omitempty"`
    MEA []MEA `xml:"MEA,omitempty"`
    QTY []QTY `xml:"QTY,omitempty"`
    PCD []PCD `xml:"PCD,omitempty"`
    ALI []ALI `xml:"ALI,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
    MOA []MOA `xml:"MOA,omitempty"`
    GIN []GIN `xml:"GIN,omitempty"`
    GIR []GIR `xml:"GIR,omitempty"`
    QVR QVR `xml:"QVR,omitempty"`
    DOC []DOC `xml:"DOC,omitempty"`
    PAI PAI `xml:"PAI,omitempty"`
    FTX []FTX `xml:"FTX,omitempty"`
    GROUP_26 []GROUP_26 `xml:"GROUP_26,omitempty"`
    GROUP_27 []GROUP_27 `xml:"GROUP_27,omitempty"`
    GROUP_28 []GROUP_28 `xml:"GROUP_28,omitempty"`
    GROUP_29 []GROUP_29 `xml:"GROUP_29,omitempty"`
    GROUP_30 []GROUP_30 `xml:"GROUP_30,omitempty"`
    GROUP_33 []GROUP_33 `xml:"GROUP_33,omitempty"`
    GROUP_34 []GROUP_34 `xml:"GROUP_34,omitempty"`
    GROUP_35 []GROUP_35 `xml:"GROUP_35,omitempty"`
    GROUP_39 []GROUP_39 `xml:"GROUP_39,omitempty"`
    GROUP_45 []GROUP_45 `xml:"GROUP_45,omitempty"`
    GROUP_47 []GROUP_47 `xml:"GROUP_47,omitempty"`
    GROUP_48 []GROUP_48 `xml:"GROUP_48,omitempty"`
    GROUP_49 []GROUP_49 `xml:"GROUP_49,omitempty"`
    GROUP_51 []GROUP_51 `xml:"GROUP_51,omitempty"`
    GROUP_52 []GROUP_52 `xml:"GROUP_52,omitempty"`
}

type GROUP_26 struct {
    XMLName xml.Name `xml:"GROUP_26"`
    CCI CCI `xml:"CCI"`
    CAV []CAV `xml:"CAV,omitempty"`
    MEA []MEA `xml:"MEA,omitempty"`
}

type GROUP_27 struct {
    XMLName xml.Name `xml:"GROUP_27"`
    PAT PAT `xml:"PAT"`
    DTM []DTM `xml:"DTM,omitempty"`
    PCD PCD `xml:"PCD,omitempty"`
    MOA MOA `xml:"MOA,omitempty"`
}

type GROUP_28 struct {
    XMLName xml.Name `xml:"GROUP_28"`
    PRI PRI `xml:"PRI"`
    CUX CUX `xml:"CUX,omitempty"`
    APR APR `xml:"APR,omitempty"`
    RNG RNG `xml:"RNG,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_29 struct {
    XMLName xml.Name `xml:"GROUP_29"`
    RFF RFF `xml:"RFF"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_30 struct {
    XMLName xml.Name `xml:"GROUP_30"`
    PAC PAC `xml:"PAC"`
    MEA []MEA `xml:"MEA,omitempty"`
    QTY []QTY `xml:"QTY,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
    GROUP_31 GROUP_31 `xml:"GROUP_31,omitempty"`
    GROUP_32 []GROUP_32 `xml:"GROUP_32,omitempty"`
}

type GROUP_31 struct {
    XMLName xml.Name `xml:"GROUP_31"`
    RFF RFF `xml:"RFF"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_32 struct {
    XMLName xml.Name `xml:"GROUP_32"`
    PCI PCI `xml:"PCI"`
    RFF RFF `xml:"RFF,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
    GIN []GIN `xml:"GIN,omitempty"`
}

type GROUP_33 struct {
    XMLName xml.Name `xml:"GROUP_33"`
    LOC LOC `xml:"LOC"`
    QTY QTY `xml:"QTY,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_34 struct {
    XMLName xml.Name `xml:"GROUP_34"`
    TAX TAX `xml:"TAX"`
    MOA MOA `xml:"MOA,omitempty"`
    LOC []LOC `xml:"LOC,omitempty"`
}

type GROUP_35 struct {
    XMLName xml.Name `xml:"GROUP_35"`
    NAD NAD `xml:"NAD"`
    LOC []LOC `xml:"LOC,omitempty"`
    GROUP_36 []GROUP_36 `xml:"GROUP_36,omitempty"`
    GROUP_37 []GROUP_37 `xml:"GROUP_37,omitempty"`
    GROUP_38 []GROUP_38 `xml:"GROUP_38,omitempty"`
}

type GROUP_36 struct {
    XMLName xml.Name `xml:"GROUP_36"`
    RFF RFF `xml:"RFF"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_37 struct {
    XMLName xml.Name `xml:"GROUP_37"`
    DOC DOC `xml:"DOC"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_38 struct {
    XMLName xml.Name `xml:"GROUP_38"`
    CTA CTA `xml:"CTA"`
    COM []COM `xml:"COM,omitempty"`
}

type GROUP_39 struct {
    XMLName xml.Name `xml:"GROUP_39"`
    ALC ALC `xml:"ALC"`
    ALI []ALI `xml:"ALI,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
    GROUP_40 GROUP_40 `xml:"GROUP_40,omitempty"`
    GROUP_41 GROUP_41 `xml:"GROUP_41,omitempty"`
    GROUP_42 []GROUP_42 `xml:"GROUP_42,omitempty"`
    GROUP_43 GROUP_43 `xml:"GROUP_43,omitempty"`
    GROUP_44 []GROUP_44 `xml:"GROUP_44,omitempty"`
}

type GROUP_40 struct {
    XMLName xml.Name `xml:"GROUP_40"`
    QTY QTY `xml:"QTY"`
    RNG RNG `xml:"RNG,omitempty"`
}

type GROUP_41 struct {
    XMLName xml.Name `xml:"GROUP_41"`
    PCD PCD `xml:"PCD"`
    RNG RNG `xml:"RNG,omitempty"`
}

type GROUP_42 struct {
    XMLName xml.Name `xml:"GROUP_42"`
    MOA MOA `xml:"MOA"`
    RNG RNG `xml:"RNG,omitempty"`
}

type GROUP_43 struct {
    XMLName xml.Name `xml:"GROUP_43"`
    RTE RTE `xml:"RTE"`
    RNG RNG `xml:"RNG,omitempty"`
}

type GROUP_44 struct {
    XMLName xml.Name `xml:"GROUP_44"`
    TAX TAX `xml:"TAX"`
    MOA MOA `xml:"MOA,omitempty"`
}

type GROUP_45 struct {
    XMLName xml.Name `xml:"GROUP_45"`
    TDT TDT `xml:"TDT"`
    GROUP_46 []GROUP_46 `xml:"GROUP_46,omitempty"`
}

type GROUP_46 struct {
    XMLName xml.Name `xml:"GROUP_46"`
    LOC LOC `xml:"LOC"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_47 struct {
    XMLName xml.Name `xml:"GROUP_47"`
    TOD TOD `xml:"TOD"`
    LOC []LOC `xml:"LOC,omitempty"`
}

type GROUP_48 struct {
    XMLName xml.Name `xml:"GROUP_48"`
    EQD EQD `xml:"EQD"`
    HAN []HAN `xml:"HAN,omitempty"`
    MEA []MEA `xml:"MEA,omitempty"`
    FTX []FTX `xml:"FTX,omitempty"`
}

type GROUP_49 struct {
    XMLName xml.Name `xml:"GROUP_49"`
    SCC SCC `xml:"SCC"`
    FTX []FTX `xml:"FTX,omitempty"`
    RFF []RFF `xml:"RFF,omitempty"`
    GROUP_50 []GROUP_50 `xml:"GROUP_50,omitempty"`
}

type GROUP_50 struct {
    XMLName xml.Name `xml:"GROUP_50"`
    QTY QTY `xml:"QTY"`
    DTM []DTM `xml:"DTM,omitempty"`
}

type GROUP_51 struct {
    XMLName xml.Name `xml:"GROUP_51"`
    RCS RCS `xml:"RCS"`
    RFF []RFF `xml:"RFF,omitempty"`
    DTM []DTM `xml:"DTM,omitempty"`
    FTX []FTX `xml:"FTX,omitempty"`
}

type GROUP_52 struct {
    XMLName xml.Name `xml:"GROUP_52"`
    STG STG `xml:"STG"`
    GROUP_53 []GROUP_53 `xml:"GROUP_53,omitempty"`
}

type GROUP_53 struct {
    XMLName xml.Name `xml:"GROUP_53"`
    QTY QTY `xml:"QTY"`
    MOA MOA `xml:"MOA,omitempty"`
}

type GROUP_54 struct {
    XMLName xml.Name `xml:"GROUP_54"`
    ALC ALC `xml:"ALC"`
    ALI ALI `xml:"ALI,omitempty"`
    MOA []MOA `xml:"MOA"`
}

type ALC struct {
    XMLName xml.Name `xml:"ALC"`
    ALC01 type5463 `xml:"ALC01"`
    ALC02  `xml:"ALC02,omitempty"`
    ALC03 type4471 `xml:"ALC03,omitempty"`
    ALC04 type1227 `xml:"ALC04,omitempty"`
    ALC05  `xml:"ALC05,omitempty"`
}

type ALI struct {
    XMLName xml.Name `xml:"ALI"`
    ALI01 type3239 `xml:"ALI01,omitempty"`
    ALI02 type9213 `xml:"ALI02,omitempty"`
    ALI03 type4183 `xml:"ALI03,omitempty"`
    ALI04 type4183 `xml:"ALI04,omitempty"`
    ALI05 type4183 `xml:"ALI05,omitempty"`
    ALI06 type4183 `xml:"ALI06,omitempty"`
    ALI07 type4183 `xml:"ALI07,omitempty"`
}

type APR struct {
    XMLName xml.Name `xml:"APR"`
    APR01 type4043 `xml:"APR01,omitempty"`
    APR02  `xml:"APR02,omitempty"`
    APR03  `xml:"APR03,omitempty"`
}

type BGM struct {
    XMLName xml.Name `xml:"BGM"`
    BGM01  `xml:"BGM01,omitempty"`
    BGM02 type1004 `xml:"BGM02,omitempty"`
    BGM03 type1225 `xml:"BGM03,omitempty"`
    BGM04 type4343 `xml:"BGM04,omitempty"`
}

type CAV struct {
    XMLName xml.Name `xml:"CAV"`
    CAV01  `xml:"CAV01"`
}

type CCI struct {
    XMLName xml.Name `xml:"CCI"`
    CCI01 type7059 `xml:"CCI01,omitempty"`
    CCI02  `xml:"CCI02,omitempty"`
    CCI03  `xml:"CCI03,omitempty"`
}

type CNT struct {
    XMLName xml.Name `xml:"CNT"`
    CNT01  `xml:"CNT01"`
}

type COM struct {
    XMLName xml.Name `xml:"COM"`
    COM01  `xml:"COM01"`
}

type CTA struct {
    XMLName xml.Name `xml:"CTA"`
    CTA01 type3139 `xml:"CTA01,omitempty"`
    CTA02  `xml:"CTA02,omitempty"`
}

type CUX struct {
    XMLName xml.Name `xml:"CUX"`
    CUX01  `xml:"CUX01,omitempty"`
    CUX02  `xml:"CUX02,omitempty"`
    CUX03 type5402 `xml:"CUX03,omitempty"`
    CUX04 type6341 `xml:"CUX04,omitempty"`
}

type DOC struct {
    XMLName xml.Name `xml:"DOC"`
    DOC01  `xml:"DOC01"`
    DOC02  `xml:"DOC02,omitempty"`
    DOC03 type3153 `xml:"DOC03,omitempty"`
    DOC04 type1220 `xml:"DOC04,omitempty"`
    DOC05 type1218 `xml:"DOC05,omitempty"`
}

type DTM struct {
    XMLName xml.Name `xml:"DTM"`
    DTM01  `xml:"DTM01"`
}

type EQD struct {
    XMLName xml.Name `xml:"EQD"`
    EQD01 type8053 `xml:"EQD01"`
    EQD02  `xml:"EQD02,omitempty"`
    EQD03  `xml:"EQD03,omitempty"`
    EQD04 type8077 `xml:"EQD04,omitempty"`
    EQD05 type8249 `xml:"EQD05,omitempty"`
    EQD06 type8169 `xml:"EQD06,omitempty"`
}

type FII struct {
    XMLName xml.Name `xml:"FII"`
    FII01 type3035 `xml:"FII01"`
    FII02  `xml:"FII02,omitempty"`
    FII03  `xml:"FII03,omitempty"`
    FII04 type3207 `xml:"FII04,omitempty"`
}

type FTX struct {
    XMLName xml.Name `xml:"FTX"`
    FTX01 type4451 `xml:"FTX01"`
    FTX02 type4453 `xml:"FTX02,omitempty"`
    FTX03  `xml:"FTX03,omitempty"`
    FTX04  `xml:"FTX04,omitempty"`
    FTX05 type3453 `xml:"FTX05,omitempty"`
}

type GIN struct {
    XMLName xml.Name `xml:"GIN"`
    GIN01 type7405 `xml:"GIN01"`
    GIN02  `xml:"GIN02"`
    GIN03  `xml:"GIN03,omitempty"`
    GIN04  `xml:"GIN04,omitempty"`
    GIN05  `xml:"GIN05,omitempty"`
    GIN06  `xml:"GIN06,omitempty"`
}

type GIR struct {
    XMLName xml.Name `xml:"GIR"`
    GIR01 type7297 `xml:"GIR01"`
    GIR02  `xml:"GIR02"`
    GIR03  `xml:"GIR03,omitempty"`
    GIR04  `xml:"GIR04,omitempty"`
    GIR05  `xml:"GIR05,omitempty"`
    GIR06  `xml:"GIR06,omitempty"`
}

type HAN struct {
    XMLName xml.Name `xml:"HAN"`
    HAN01  `xml:"HAN01,omitempty"`
    HAN02  `xml:"HAN02,omitempty"`
}

type IMD struct {
    XMLName xml.Name `xml:"IMD"`
    IMD01 type7077 `xml:"IMD01,omitempty"`
    IMD02 type7081 `xml:"IMD02,omitempty"`
    IMD03  `xml:"IMD03,omitempty"`
    IMD04 type7383 `xml:"IMD04,omitempty"`
}

type LIN struct {
    XMLName xml.Name `xml:"LIN"`
    LIN01 type1082 `xml:"LIN01,omitempty"`
    LIN02 type1229 `xml:"LIN02,omitempty"`
    LIN03  `xml:"LIN03,omitempty"`
    LIN04  `xml:"LIN04,omitempty"`
    LIN05 type1222 `xml:"LIN05,omitempty"`
    LIN06 type7083 `xml:"LIN06,omitempty"`
}

type LOC struct {
    XMLName xml.Name `xml:"LOC"`
    LOC01 type3227 `xml:"LOC01"`
    LOC02  `xml:"LOC02,omitempty"`
    LOC03  `xml:"LOC03,omitempty"`
    LOC04  `xml:"LOC04,omitempty"`
    LOC05 type5479 `xml:"LOC05,omitempty"`
}

type MEA struct {
    XMLName xml.Name `xml:"MEA"`
    MEA01 type6311 `xml:"MEA01"`
    MEA02  `xml:"MEA02,omitempty"`
    MEA03  `xml:"MEA03,omitempty"`
    MEA04 type7383 `xml:"MEA04,omitempty"`
}

type MOA struct {
    XMLName xml.Name `xml:"MOA"`
    MOA01  `xml:"MOA01"`
}

type NAD struct {
    XMLName xml.Name `xml:"NAD"`
    NAD01 type3035 `xml:"NAD01"`
    NAD02  `xml:"NAD02,omitempty"`
    NAD03  `xml:"NAD03,omitempty"`
    NAD04  `xml:"NAD04,omitempty"`
    NAD05  `xml:"NAD05,omitempty"`
    NAD06 type3164 `xml:"NAD06,omitempty"`
    NAD07 type3229 `xml:"NAD07,omitempty"`
    NAD08 type3251 `xml:"NAD08,omitempty"`
    NAD09 type3207 `xml:"NAD09,omitempty"`
}

type PAC struct {
    XMLName xml.Name `xml:"PAC"`
    PAC01 type7224 `xml:"PAC01,omitempty"`
    PAC02  `xml:"PAC02,omitempty"`
    PAC03  `xml:"PAC03,omitempty"`
    PAC04  `xml:"PAC04,omitempty"`
    PAC05  `xml:"PAC05,omitempty"`
}

type PAI struct {
    XMLName xml.Name `xml:"PAI"`
    PAI01  `xml:"PAI01"`
}

type PAT struct {
    XMLName xml.Name `xml:"PAT"`
    PAT01 type4279 `xml:"PAT01"`
    PAT02  `xml:"PAT02,omitempty"`
    PAT03  `xml:"PAT03,omitempty"`
}

type PCD struct {
    XMLName xml.Name `xml:"PCD"`
    PCD01  `xml:"PCD01"`
}

type PCI struct {
    XMLName xml.Name `xml:"PCI"`
    PCI01 type4233 `xml:"PCI01,omitempty"`
    PCI02  `xml:"PCI02,omitempty"`
    PCI03 type8275 `xml:"PCI03,omitempty"`
    PCI04  `xml:"PCI04,omitempty"`
}

type PIA struct {
    XMLName xml.Name `xml:"PIA"`
    PIA01 type4347 `xml:"PIA01"`
    PIA02  `xml:"PIA02"`
    PIA03  `xml:"PIA03,omitempty"`
    PIA04  `xml:"PIA04,omitempty"`
    PIA05  `xml:"PIA05,omitempty"`
    PIA06  `xml:"PIA06,omitempty"`
}

type PRI struct {
    XMLName xml.Name `xml:"PRI"`
    PRI01  `xml:"PRI01,omitempty"`
    PRI02 type5213 `xml:"PRI02,omitempty"`
}

type QTY struct {
    XMLName xml.Name `xml:"QTY"`
    QTY01  `xml:"QTY01"`
}

type QVR struct {
    XMLName xml.Name `xml:"QVR"`
    QVR01  `xml:"QVR01,omitempty"`
    QVR02 type4221 `xml:"QVR02,omitempty"`
    QVR03  `xml:"QVR03,omitempty"`
}

type RCS struct {
    XMLName xml.Name `xml:"RCS"`
    RCS01 type7293 `xml:"RCS01"`
    RCS02  `xml:"RCS02,omitempty"`
    RCS03 type1229 `xml:"RCS03,omitempty"`
}

type RFF struct {
    XMLName xml.Name `xml:"RFF"`
    RFF01  `xml:"RFF01"`
}

type RNG struct {
    XMLName xml.Name `xml:"RNG"`
    RNG01 type6167 `xml:"RNG01"`
    RNG02  `xml:"RNG02,omitempty"`
}

type RTE struct {
    XMLName xml.Name `xml:"RTE"`
    RTE01  `xml:"RTE01"`
}

type SCC struct {
    XMLName xml.Name `xml:"SCC"`
    SCC01 type4017 `xml:"SCC01"`
    SCC02 type4493 `xml:"SCC02,omitempty"`
    SCC03  `xml:"SCC03,omitempty"`
}

type STG struct {
    XMLName xml.Name `xml:"STG"`
    STG01 type9421 `xml:"STG01"`
    STG02 type6426 `xml:"STG02,omitempty"`
    STG03 type6428 `xml:"STG03,omitempty"`
}

type TAX struct {
    XMLName xml.Name `xml:"TAX"`
    TAX01 type5283 `xml:"TAX01"`
    TAX02  `xml:"TAX02,omitempty"`
    TAX03  `xml:"TAX03,omitempty"`
    TAX04 type5286 `xml:"TAX04,omitempty"`
    TAX05  `xml:"TAX05,omitempty"`
    TAX06 type5305 `xml:"TAX06,omitempty"`
    TAX07 type3446 `xml:"TAX07,omitempty"`
}

type TDT struct {
    XMLName xml.Name `xml:"TDT"`
    TDT01 type8051 `xml:"TDT01"`
    TDT02 type8028 `xml:"TDT02,omitempty"`
    TDT03  `xml:"TDT03,omitempty"`
    TDT04  `xml:"TDT04,omitempty"`
    TDT05  `xml:"TDT05,omitempty"`
    TDT06 type8101 `xml:"TDT06,omitempty"`
    TDT07  `xml:"TDT07,omitempty"`
    TDT08  `xml:"TDT08,omitempty"`
    TDT09 type8281 `xml:"TDT09,omitempty"`
}

type TOD struct {
    XMLName xml.Name `xml:"TOD"`
    TOD01 type4055 `xml:"TOD01,omitempty"`
    TOD02 type4215 `xml:"TOD02,omitempty"`
    TOD03  `xml:"TOD03,omitempty"`
}

type UNB struct {
    XMLName xml.Name `xml:"UNB"`
    UNB01  `xml:"UNB01"`
    UNB02  `xml:"UNB02"`
    UNB03  `xml:"UNB03"`
    UNB04  `xml:"UNB04"`
    UNB05 type0020 `xml:"UNB05"`
    UNB06  `xml:"UNB06,omitempty"`
    UNB07 type0026 `xml:"UNB07,omitempty"`
    UNB08 type0029 `xml:"UNB08,omitempty"`
    UNB09 type0031 `xml:"UNB09,omitempty"`
    UNB10 type0032 `xml:"UNB10,omitempty"`
    UNB11 type0035 `xml:"UNB11,omitempty"`
}

type UNE struct {
    XMLName xml.Name `xml:"UNE"`
    UNE01 type0060 `xml:"UNE01"`
    UNE02 type0048 `xml:"UNE02"`
}

type UNG struct {
    XMLName xml.Name `xml:"UNG"`
    UNG01 type0038 `xml:"UNG01"`
    UNG02  `xml:"UNG02"`
    UNG03  `xml:"UNG03"`
    UNG04  `xml:"UNG04"`
    UNG05 type0048 `xml:"UNG05"`
    UNG06 type0051 `xml:"UNG06"`
    UNG07  `xml:"UNG07"`
    UNG08 type0058 `xml:"UNG08,omitempty"`
}

type UNH struct {
    XMLName xml.Name `xml:"UNH"`
    UNH01 type0062 `xml:"UNH01"`
    UNH02  `xml:"UNH02"`
    UNH03 type0068 `xml:"UNH03,omitempty"`
    UNH04  `xml:"UNH04,omitempty"`
}

type UNS struct {
    XMLName xml.Name `xml:"UNS"`
    UNS01 type0081 `xml:"UNS01"`
}

type UNT struct {
    XMLName xml.Name `xml:"UNT"`
    UNT01 type0074 `xml:"UNT01"`
    UNT02 type0062 `xml:"UNT02"`
}

type UNZ struct {
    XMLName xml.Name `xml:"UNZ"`
    UNZ01 type0036 `xml:"UNZ01"`
    UNZ02 type0020 `xml:"UNZ02"`
}

type EDIFACT struct {
    XMLName xml.Name `xml:"EDIFACT"`
    Content EDIFACT `xml:",innerxml"`
}

