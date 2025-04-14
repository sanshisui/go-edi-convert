declare function local:thisDate($size as xs:integer) as xs:string {
	translate(substring(xs:string(current-date()), if ($size = 6) then 3 else 1, if ($size = 6) then 8 else 10), '-', '')
};
declare function local:thisTime() as xs:string {
	translate(substring(xs:string(current-time()), 1, 5), ':', '')
};

declare option ddtek:serialize "method=EDI";
<EDIFACT>
	<UNB>
		<UNB01>
			<UNB0101><!--0001: Syntax identifier-->UNOC</UNB0101>
			<UNB0102><!--0002: Syntax version number-->3</UNB0102>
		</UNB01>
		<UNB02>
			<UNB0201><!--0004: Sender identification-->ISENDER</UNB0201>
			<UNB0202><!--0007: Partner identification code qualifier-->ZZZ</UNB0202>
		</UNB02>
		<UNB03>
			<UNB0301><!--0010: Recipient identification-->IRECIPIENT</UNB0301>
			<UNB0302><!--0007: Partner identification code qualifier-->ZZZ</UNB0302>
		</UNB03>
		<UNB04>
			<UNB0401><!--0017: Date of preparation-->{ local:thisDate(6) }</UNB0401>
			<UNB0402><!--0019: Time of preparation-->{ local:thisTime() }</UNB0402>
		</UNB04>
		<UNB05><!--0020: Interchange control reference-->ICONTROL</UNB05>
	</UNB>
	<ORDERS>
		<UNH>
			<UNH01><!--0062: Message reference number-->MESSAGENUMBER</UNH01>
			<UNH02>
				<UNH0201><!--0065: Message type-->ORDERS</UNH0201>
				<UNH0202><!--0052: Message version number-->D</UNH0202>
				<UNH0203><!--0054: Message release number-->96A</UNH0203>
				<UNH0204><!--0051: Controlling agency-->UN</UNH0204>
			</UNH02>
		</UNH>
		<BGM>
			<BGM01>
				<BGM0101><!--1001: DOCUMENT/MESSAGE NAME, CODED--></BGM0101>
				<BGM0102><!--1131: Code list qualifier--></BGM0102>
				<BGM0103><!--3055: Code list responsible agency, coded--></BGM0103>
				<BGM0104><!--1000: Document/message name--></BGM0104>
			</BGM01>
			<BGM02><!--1004: Document/message number--></BGM02>
			<BGM03><!--1225: MESSAGE FUNCTION, CODED--></BGM03>
			<BGM04><!--4343: RESPONSE TYPE, CODED--></BGM04>
		</BGM>
		<DTM>
			<DTM01>
				<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
				<DTM0102><!--2380: Date/time/period--></DTM0102>
				<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
			</DTM01>
		</DTM>
		<PAI>
			<PAI01>
				<PAI0101><!--4439: Payment conditions, coded--></PAI0101>
				<PAI0102><!--4431: Payment guarantee, coded--></PAI0102>
				<PAI0103><!--4461: Payment means, coded--></PAI0103>
				<PAI0104><!--1131: Code list qualifier--></PAI0104>
				<PAI0105><!--3055: Code list responsible agency, coded--></PAI0105>
				<PAI0106><!--4435: Payment channel, coded--></PAI0106>
			</PAI01>
		</PAI>
		<ALI>
			<ALI01><!--3239: COUNTRY OF ORIGIN, CODED--></ALI01>
			<ALI02><!--9213: TYPE OF DUTY REGIME, CODED--></ALI02>
			<ALI03><!--4183: SPECIAL CONDITIONS, CODED--></ALI03>
			<ALI04><!--4183: SPECIAL CONDITIONS, CODED--></ALI04>
			<ALI05><!--4183: SPECIAL CONDITIONS, CODED--></ALI05>
			<ALI06><!--4183: SPECIAL CONDITIONS, CODED--></ALI06>
			<ALI07><!--4183: SPECIAL CONDITIONS, CODED--></ALI07>
		</ALI>
		<IMD>
			<IMD01><!--7077: ITEM DESCRIPTION TYPE, CODED--></IMD01>
			<IMD02><!--7081: ITEM CHARACTERISTIC, CODED--></IMD02>
			<IMD03>
				<IMD0301><!--7009: Item description identification--></IMD0301>
				<IMD0302><!--1131: Code list qualifier--></IMD0302>
				<IMD0303><!--3055: Code list responsible agency, coded--></IMD0303>
				<IMD0304><!--7008: Item description--></IMD0304>
				<IMD0305><!--7008: Item description--></IMD0305>
				<IMD0306><!--3453: Language, coded--></IMD0306>
			</IMD03>
			<IMD04><!--7383: SURFACE/LAYER INDICATOR, CODED--></IMD04>
		</IMD>
		<FTX>
			<FTX01><!--4451: TEXT SUBJECT QUALIFIER--></FTX01>
			<FTX02><!--4453: TEXT FUNCTION, CODED--></FTX02>
			<FTX03>
				<FTX0301><!--4441: Free text, coded--></FTX0301>
				<FTX0302><!--1131: Code list qualifier--></FTX0302>
				<FTX0303><!--3055: Code list responsible agency, coded--></FTX0303>
			</FTX03>
			<FTX04>
				<FTX0401><!--4440: Free text--></FTX0401>
				<FTX0402><!--4440: Free text--></FTX0402>
				<FTX0403><!--4440: Free text--></FTX0403>
				<FTX0404><!--4440: Free text--></FTX0404>
				<FTX0405><!--4440: Free text--></FTX0405>
			</FTX04>
			<FTX05><!--3453: Language, coded--></FTX05>
		</FTX>
		<GROUP_1>
			<RFF>
				<RFF01>
					<RFF0101><!--1153: Reference qualifier--></RFF0101>
					<RFF0102><!--1154: Reference number--></RFF0102>
					<RFF0103><!--1156: Line number--></RFF0103>
					<RFF0104><!--4000: Reference version number--></RFF0104>
				</RFF01>
			</RFF>
			<DTM>
				<DTM01>
					<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
					<DTM0102><!--2380: Date/time/period--></DTM0102>
					<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
				</DTM01>
			</DTM>
		</GROUP_1>
		<GROUP_2>
			<NAD>
				<NAD01><!--3035: PARTY QUALIFIER--></NAD01>
				<NAD02>
					<NAD0201><!--3039: Party id. identification--></NAD0201>
					<NAD0202><!--1131: Code list qualifier--></NAD0202>
					<NAD0203><!--3055: Code list responsible agency, coded--></NAD0203>
				</NAD02>
				<NAD03>
					<NAD0301><!--3124: Name and address line--></NAD0301>
					<NAD0302><!--3124: Name and address line--></NAD0302>
					<NAD0303><!--3124: Name and address line--></NAD0303>
					<NAD0304><!--3124: Name and address line--></NAD0304>
					<NAD0305><!--3124: Name and address line--></NAD0305>
				</NAD03>
				<NAD04>
					<NAD0401><!--3036: Party name--></NAD0401>
					<NAD0402><!--3036: Party name--></NAD0402>
					<NAD0403><!--3036: Party name--></NAD0403>
					<NAD0404><!--3036: Party name--></NAD0404>
					<NAD0405><!--3036: Party name--></NAD0405>
					<NAD0406><!--3045: Party name format, coded--></NAD0406>
				</NAD04>
				<NAD05>
					<NAD0501><!--3042: Street and number/p.o. box--></NAD0501>
					<NAD0502><!--3042: Street and number/p.o. box--></NAD0502>
					<NAD0503><!--3042: Street and number/p.o. box--></NAD0503>
					<NAD0504><!--3042: Street and number/p.o. box--></NAD0504>
				</NAD05>
				<NAD06><!--3164: CITY NAME--></NAD06>
				<NAD07><!--3229: Country sub-entity identification--></NAD07>
				<NAD08><!--3251: POSTCODE IDENTIFICATION--></NAD08>
				<NAD09><!--3207: Country, coded--></NAD09>
			</NAD>
			<LOC>
				<LOC01><!--3227: PLACE/LOCATION QUALIFIER--></LOC01>
				<LOC02>
					<LOC0201><!--3225: Place/location identification--></LOC0201>
					<LOC0202><!--1131: Code list qualifier--></LOC0202>
					<LOC0203><!--3055: Code list responsible agency, coded--></LOC0203>
					<LOC0204><!--3224: Place/location--></LOC0204>
				</LOC02>
				<LOC03>
					<LOC0301><!--3223: Related place/location one identification--></LOC0301>
					<LOC0302><!--1131: Code list qualifier--></LOC0302>
					<LOC0303><!--3055: Code list responsible agency, coded--></LOC0303>
					<LOC0304><!--3222: Related place/location one--></LOC0304>
				</LOC03>
				<LOC04>
					<LOC0401><!--3233: Related place/location two identification--></LOC0401>
					<LOC0402><!--1131: Code list qualifier--></LOC0402>
					<LOC0403><!--3055: Code list responsible agency, coded--></LOC0403>
					<LOC0404><!--3232: Related place/location two--></LOC0404>
				</LOC04>
				<LOC05><!--5479: RELATION, CODED--></LOC05>
			</LOC>
			<FII>
				<FII01><!--3035: PARTY QUALIFIER--></FII01>
				<FII02>
					<FII0201><!--3194: Account holder number--></FII0201>
					<FII0202><!--3192: Account holder name--></FII0202>
					<FII0203><!--3192: Account holder name--></FII0203>
					<FII0204><!--6345: Currency, coded--></FII0204>
				</FII02>
				<FII03>
					<FII0301><!--3433: Institution name identification--></FII0301>
					<FII0302><!--1131: Code list qualifier--></FII0302>
					<FII0303><!--3055: Code list responsible agency, coded--></FII0303>
					<FII0304><!--3434: Institution branch number--></FII0304>
					<FII0305><!--1131: Code list qualifier--></FII0305>
					<FII0306><!--3055: Code list responsible agency, coded--></FII0306>
					<FII0307><!--3432: Institution name--></FII0307>
					<FII0308><!--3436: Institution branch place--></FII0308>
				</FII03>
				<FII04><!--3207: Country, coded--></FII04>
			</FII>
			<GROUP_3>
				<RFF>
					<RFF01>
						<RFF0101><!--1153: Reference qualifier--></RFF0101>
						<RFF0102><!--1154: Reference number--></RFF0102>
						<RFF0103><!--1156: Line number--></RFF0103>
						<RFF0104><!--4000: Reference version number--></RFF0104>
					</RFF01>
				</RFF>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
			</GROUP_3>
			<GROUP_4>
				<DOC>
					<DOC01>
						<DOC0101><!--1001: DOCUMENT/MESSAGE NAME, CODED--></DOC0101>
						<DOC0102><!--1131: Code list qualifier--></DOC0102>
						<DOC0103><!--3055: Code list responsible agency, coded--></DOC0103>
						<DOC0104><!--1000: Document/message name--></DOC0104>
					</DOC01>
					<DOC02>
						<DOC0201><!--1004: Document/message number--></DOC0201>
						<DOC0202><!--1373: Document/message status, coded--></DOC0202>
						<DOC0203><!--1366: Document/message source--></DOC0203>
						<DOC0204><!--3453: Language, coded--></DOC0204>
					</DOC02>
					<DOC03><!--3153: COMMUNICATION CHANNEL IDENTIFIER, CODED--></DOC03>
					<DOC04><!--1220: NUMBER OF COPIES OF DOCUMENT REQUIRED--></DOC04>
					<DOC05><!--1218: NUMBER OF ORIGINALS OF DOCUMENT REQUIRED--></DOC05>
				</DOC>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
			</GROUP_4>
			<GROUP_5>
				<CTA>
					<CTA01><!--3139: CONTACT FUNCTION, CODED--></CTA01>
					<CTA02>
						<CTA0201><!--3413: Department or employee identification--></CTA0201>
						<CTA0202><!--3412: Department or employee--></CTA0202>
					</CTA02>
				</CTA>
				<COM>
					<COM01>
						<COM0101><!--3148: Communication number--></COM0101>
						<COM0102><!--3155: Communication channel qualifier--></COM0102>
					</COM01>
				</COM>
			</GROUP_5>
		</GROUP_2>
		<GROUP_6>
			<TAX>
				<TAX01><!--5283: DUTY/TAX/FEE FUNCTION QUALIFIER--></TAX01>
				<TAX02>
					<TAX0201><!--5153: Duty/tax/fee type, coded--></TAX0201>
					<TAX0202><!--1131: Code list qualifier--></TAX0202>
					<TAX0203><!--3055: Code list responsible agency, coded--></TAX0203>
					<TAX0204><!--5152: Duty/tax/fee type--></TAX0204>
				</TAX02>
				<TAX03>
					<TAX0301><!--5289: Duty/tax/fee account identification--></TAX0301>
					<TAX0302><!--1131: Code list qualifier--></TAX0302>
					<TAX0303><!--3055: Code list responsible agency, coded--></TAX0303>
				</TAX03>
				<TAX04><!--5286: DUTY/TAX/FEE ASSESSMENT BASIS--></TAX04>
				<TAX05>
					<TAX0501><!--5279: Duty/tax/fee rate identification--></TAX0501>
					<TAX0502><!--1131: Code list qualifier--></TAX0502>
					<TAX0503><!--3055: Code list responsible agency, coded--></TAX0503>
					<TAX0504><!--5278: Duty/tax/fee rate--></TAX0504>
					<TAX0505><!--5273: Duty/tax/fee rate basis identification--></TAX0505>
					<TAX0506><!--1131: Code list qualifier--></TAX0506>
					<TAX0507><!--3055: Code list responsible agency, coded--></TAX0507>
				</TAX05>
				<TAX06><!--5305: DUTY/TAX/FEE CATEGORY, CODED--></TAX06>
				<TAX07><!--3446: PARTY TAX IDENTIFICATION NUMBER--></TAX07>
			</TAX>
			<MOA>
				<MOA01>
					<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
					<MOA0102><!--5004: Monetary amount--></MOA0102>
					<MOA0103><!--6345: Currency, coded--></MOA0103>
					<MOA0104><!--6343: Currency qualifier--></MOA0104>
					<MOA0105><!--4405: Status, coded--></MOA0105>
				</MOA01>
			</MOA>
			<LOC>
				<LOC01><!--3227: PLACE/LOCATION QUALIFIER--></LOC01>
				<LOC02>
					<LOC0201><!--3225: Place/location identification--></LOC0201>
					<LOC0202><!--1131: Code list qualifier--></LOC0202>
					<LOC0203><!--3055: Code list responsible agency, coded--></LOC0203>
					<LOC0204><!--3224: Place/location--></LOC0204>
				</LOC02>
				<LOC03>
					<LOC0301><!--3223: Related place/location one identification--></LOC0301>
					<LOC0302><!--1131: Code list qualifier--></LOC0302>
					<LOC0303><!--3055: Code list responsible agency, coded--></LOC0303>
					<LOC0304><!--3222: Related place/location one--></LOC0304>
				</LOC03>
				<LOC04>
					<LOC0401><!--3233: Related place/location two identification--></LOC0401>
					<LOC0402><!--1131: Code list qualifier--></LOC0402>
					<LOC0403><!--3055: Code list responsible agency, coded--></LOC0403>
					<LOC0404><!--3232: Related place/location two--></LOC0404>
				</LOC04>
				<LOC05><!--5479: RELATION, CODED--></LOC05>
			</LOC>
		</GROUP_6>
		<GROUP_7>
			<CUX>
				<CUX01>
					<CUX0101><!--6347: Currency details qualifier--></CUX0101>
					<CUX0102><!--6345: Currency, coded--></CUX0102>
					<CUX0103><!--6343: Currency qualifier--></CUX0103>
					<CUX0104><!--6348: Currency rate base--></CUX0104>
				</CUX01>
				<CUX02>
					<CUX0201><!--6347: Currency details qualifier--></CUX0201>
					<CUX0202><!--6345: Currency, coded--></CUX0202>
					<CUX0203><!--6343: Currency qualifier--></CUX0203>
					<CUX0204><!--6348: Currency rate base--></CUX0204>
				</CUX02>
				<CUX03><!--5402: RATE OF EXCHANGE--></CUX03>
				<CUX04><!--6341: CURRENCY MARKET EXCHANGE, CODED--></CUX04>
			</CUX>
			<PCD>
				<PCD01>
					<PCD0101><!--5245: Percentage qualifier--></PCD0101>
					<PCD0102><!--5482: Percentage--></PCD0102>
					<PCD0103><!--5249: Percentage basis, coded--></PCD0103>
					<PCD0104><!--1131: Code list qualifier--></PCD0104>
					<PCD0105><!--3055: Code list responsible agency, coded--></PCD0105>
				</PCD01>
			</PCD>
			<DTM>
				<DTM01>
					<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
					<DTM0102><!--2380: Date/time/period--></DTM0102>
					<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
				</DTM01>
			</DTM>
		</GROUP_7>
		<GROUP_8>
			<PAT>
				<PAT01><!--4279: PAYMENT TERMS TYPE QUALIFIER--></PAT01>
				<PAT02>
					<PAT0201><!--4277: Terms of payment identification--></PAT0201>
					<PAT0202><!--1131: Code list qualifier--></PAT0202>
					<PAT0203><!--3055: Code list responsible agency, coded--></PAT0203>
					<PAT0204><!--4276: Terms of payment--></PAT0204>
					<PAT0205><!--4276: Terms of payment--></PAT0205>
				</PAT02>
				<PAT03>
					<PAT0301><!--2475: Payment time reference, coded--></PAT0301>
					<PAT0302><!--2009: Time relation, coded--></PAT0302>
					<PAT0303><!--2151: Type of period, coded--></PAT0303>
					<PAT0304><!--2152: Number of periods--></PAT0304>
				</PAT03>
			</PAT>
			<DTM>
				<DTM01>
					<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
					<DTM0102><!--2380: Date/time/period--></DTM0102>
					<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
				</DTM01>
			</DTM>
			<PCD>
				<PCD01>
					<PCD0101><!--5245: Percentage qualifier--></PCD0101>
					<PCD0102><!--5482: Percentage--></PCD0102>
					<PCD0103><!--5249: Percentage basis, coded--></PCD0103>
					<PCD0104><!--1131: Code list qualifier--></PCD0104>
					<PCD0105><!--3055: Code list responsible agency, coded--></PCD0105>
				</PCD01>
			</PCD>
			<MOA>
				<MOA01>
					<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
					<MOA0102><!--5004: Monetary amount--></MOA0102>
					<MOA0103><!--6345: Currency, coded--></MOA0103>
					<MOA0104><!--6343: Currency qualifier--></MOA0104>
					<MOA0105><!--4405: Status, coded--></MOA0105>
				</MOA01>
			</MOA>
		</GROUP_8>
		<GROUP_9>
			<TDT>
				<TDT01><!--8051: TRANSPORT STAGE QUALIFIER--></TDT01>
				<TDT02><!--8028: CONVEYANCE REFERENCE NUMBER--></TDT02>
				<TDT03>
					<TDT0301><!--8067: Mode of transport, coded--></TDT0301>
					<TDT0302><!--8066: Mode of transport--></TDT0302>
				</TDT03>
				<TDT04>
					<TDT0401><!--8179: Type of means of transport identification--></TDT0401>
					<TDT0402><!--8178: Type of means of transport--></TDT0402>
				</TDT04>
				<TDT05>
					<TDT0501><!--3127: Carrier identification--></TDT0501>
					<TDT0502><!--1131: Code list qualifier--></TDT0502>
					<TDT0503><!--3055: Code list responsible agency, coded--></TDT0503>
					<TDT0504><!--3128: Carrier name--></TDT0504>
				</TDT05>
				<TDT06><!--8101: TRANSIT DIRECTION, CODED--></TDT06>
				<TDT07>
					<TDT0701><!--8457: Excess transportation reason, coded--></TDT0701>
					<TDT0702><!--8459: Excess transportation responsibility, coded--></TDT0702>
					<TDT0703><!--7130: Customer authorization number--></TDT0703>
				</TDT07>
				<TDT08>
					<TDT0801><!--8213: Id. of means of transport identification--></TDT0801>
					<TDT0802><!--1131: Code list qualifier--></TDT0802>
					<TDT0803><!--3055: Code list responsible agency, coded--></TDT0803>
					<TDT0804><!--8212: Id. of the means of transport--></TDT0804>
					<TDT0805><!--8453: Nationality of means of transport, coded--></TDT0805>
				</TDT08>
				<TDT09><!--8281: TRANSPORT OWNERSHIP, CODED--></TDT09>
			</TDT>
			<GROUP_10>
				<LOC>
					<LOC01><!--3227: PLACE/LOCATION QUALIFIER--></LOC01>
					<LOC02>
						<LOC0201><!--3225: Place/location identification--></LOC0201>
						<LOC0202><!--1131: Code list qualifier--></LOC0202>
						<LOC0203><!--3055: Code list responsible agency, coded--></LOC0203>
						<LOC0204><!--3224: Place/location--></LOC0204>
					</LOC02>
					<LOC03>
						<LOC0301><!--3223: Related place/location one identification--></LOC0301>
						<LOC0302><!--1131: Code list qualifier--></LOC0302>
						<LOC0303><!--3055: Code list responsible agency, coded--></LOC0303>
						<LOC0304><!--3222: Related place/location one--></LOC0304>
					</LOC03>
					<LOC04>
						<LOC0401><!--3233: Related place/location two identification--></LOC0401>
						<LOC0402><!--1131: Code list qualifier--></LOC0402>
						<LOC0403><!--3055: Code list responsible agency, coded--></LOC0403>
						<LOC0404><!--3232: Related place/location two--></LOC0404>
					</LOC04>
					<LOC05><!--5479: RELATION, CODED--></LOC05>
				</LOC>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
			</GROUP_10>
		</GROUP_9>
		<GROUP_11>
			<TOD>
				<TOD01><!--4055: TERMS OF DELIVERY OR TRANSPORT FUNCTION, CODED--></TOD01>
				<TOD02><!--4215: Transport charges method of payment, coded--></TOD02>
				<TOD03>
					<TOD0301><!--4053: Terms of delivery or transport, coded--></TOD0301>
					<TOD0302><!--1131: Code list qualifier--></TOD0302>
					<TOD0303><!--3055: Code list responsible agency, coded--></TOD0303>
					<TOD0304><!--4052: Terms of delivery or transport--></TOD0304>
					<TOD0305><!--4052: Terms of delivery or transport--></TOD0305>
				</TOD03>
			</TOD>
			<LOC>
				<LOC01><!--3227: PLACE/LOCATION QUALIFIER--></LOC01>
				<LOC02>
					<LOC0201><!--3225: Place/location identification--></LOC0201>
					<LOC0202><!--1131: Code list qualifier--></LOC0202>
					<LOC0203><!--3055: Code list responsible agency, coded--></LOC0203>
					<LOC0204><!--3224: Place/location--></LOC0204>
				</LOC02>
				<LOC03>
					<LOC0301><!--3223: Related place/location one identification--></LOC0301>
					<LOC0302><!--1131: Code list qualifier--></LOC0302>
					<LOC0303><!--3055: Code list responsible agency, coded--></LOC0303>
					<LOC0304><!--3222: Related place/location one--></LOC0304>
				</LOC03>
				<LOC04>
					<LOC0401><!--3233: Related place/location two identification--></LOC0401>
					<LOC0402><!--1131: Code list qualifier--></LOC0402>
					<LOC0403><!--3055: Code list responsible agency, coded--></LOC0403>
					<LOC0404><!--3232: Related place/location two--></LOC0404>
				</LOC04>
				<LOC05><!--5479: RELATION, CODED--></LOC05>
			</LOC>
		</GROUP_11>
		<GROUP_12>
			<PAC>
				<PAC01><!--7224: NUMBER OF PACKAGES--></PAC01>
				<PAC02>
					<PAC0201><!--7075: Packaging level, coded--></PAC0201>
					<PAC0202><!--7233: Packaging related information, coded--></PAC0202>
					<PAC0203><!--7073: Packaging terms and conditions, coded--></PAC0203>
				</PAC02>
				<PAC03>
					<PAC0301><!--7065: Type of packages identification--></PAC0301>
					<PAC0302><!--1131: Code list qualifier--></PAC0302>
					<PAC0303><!--3055: Code list responsible agency, coded--></PAC0303>
					<PAC0304><!--7064: Type of packages--></PAC0304>
				</PAC03>
				<PAC04>
					<PAC0401><!--7077: ITEM DESCRIPTION TYPE, CODED--></PAC0401>
					<PAC0402><!--7064: Type of packages--></PAC0402>
					<PAC0403><!--7143: Item number type, coded--></PAC0403>
					<PAC0404><!--7064: Type of packages--></PAC0404>
					<PAC0405><!--7143: Item number type, coded--></PAC0405>
				</PAC04>
				<PAC05>
					<PAC0501><!--8395: Returnable package freight payment--></PAC0501>
					<PAC0502><!--8393: Returnable package load contents code--></PAC0502>
				</PAC05>
			</PAC>
			<MEA>
				<MEA01><!--6311: MEASUREMENT APPLICATION QUALIFIER--></MEA01>
				<MEA02>
					<MEA0201><!--6313: Measurement dimension, coded--></MEA0201>
					<MEA0202><!--6321: Measurement significance, coded--></MEA0202>
					<MEA0203><!--6155: Measurement attribute, coded--></MEA0203>
					<MEA0204><!--6154: Measurement attribute--></MEA0204>
				</MEA02>
				<MEA03>
					<MEA0301><!--6411: Measure unit qualifier--></MEA0301>
					<MEA0302><!--6314: Measurement value--></MEA0302>
					<MEA0303><!--6162: Range minimum--></MEA0303>
					<MEA0304><!--6152: Range maximum--></MEA0304>
					<MEA0305><!--6432: Significant digits--></MEA0305>
				</MEA03>
				<MEA04><!--7383: SURFACE/LAYER INDICATOR, CODED--></MEA04>
			</MEA>
			<GROUP_13>
				<PCI>
					<PCI01><!--4233: MARKING INSTRUCTIONS, CODED--></PCI01>
					<PCI02>
						<PCI0201><!--7102: Shipping marks--></PCI0201>
						<PCI0202><!--7102: Shipping marks--></PCI0202>
						<PCI0203><!--7102: Shipping marks--></PCI0203>
						<PCI0204><!--7102: Shipping marks--></PCI0204>
						<PCI0205><!--7102: Shipping marks--></PCI0205>
						<PCI0206><!--7102: Shipping marks--></PCI0206>
						<PCI0207><!--7102: Shipping marks--></PCI0207>
						<PCI0208><!--7102: Shipping marks--></PCI0208>
						<PCI0209><!--7102: Shipping marks--></PCI0209>
						<PCI0210><!--7102: Shipping marks--></PCI0210>
					</PCI02>
					<PCI03><!--8275: CONTAINER/PACKAGE STATUS, CODED--></PCI03>
					<PCI04>
						<PCI0401><!--7511: Type of marking, coded--></PCI0401>
						<PCI0402><!--1131: Code list qualifier--></PCI0402>
						<PCI0403><!--3055: Code list responsible agency, coded--></PCI0403>
					</PCI04>
				</PCI>
				<RFF>
					<RFF01>
						<RFF0101><!--1153: Reference qualifier--></RFF0101>
						<RFF0102><!--1154: Reference number--></RFF0102>
						<RFF0103><!--1156: Line number--></RFF0103>
						<RFF0104><!--4000: Reference version number--></RFF0104>
					</RFF01>
				</RFF>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
				<GIN>
					<GIN01><!--7405: Identity number qualifier--></GIN01>
					<GIN02>
						<GIN0201><!--7402: Identity number--></GIN0201>
						<GIN0202><!--7402: Identity number--></GIN0202>
					</GIN02>
					<GIN03>
						<GIN0301><!--7402: Identity number--></GIN0301>
						<GIN0302><!--7402: Identity number--></GIN0302>
					</GIN03>
					<GIN04>
						<GIN0401><!--7402: Identity number--></GIN0401>
						<GIN0402><!--7402: Identity number--></GIN0402>
					</GIN04>
					<GIN05>
						<GIN0501><!--7402: Identity number--></GIN0501>
						<GIN0502><!--7402: Identity number--></GIN0502>
					</GIN05>
					<GIN06>
						<GIN0601><!--7402: Identity number--></GIN0601>
						<GIN0602><!--7402: Identity number--></GIN0602>
					</GIN06>
				</GIN>
			</GROUP_13>
		</GROUP_12>
		<GROUP_14>
			<EQD>
				<EQD01><!--8053: EQUIPMENT QUALIFIER--></EQD01>
				<EQD02>
					<EQD0201><!--8260: Equipment identification number--></EQD0201>
					<EQD0202><!--1131: Code list qualifier--></EQD0202>
					<EQD0203><!--3055: Code list responsible agency, coded--></EQD0203>
					<EQD0204><!--3207: Country, coded--></EQD0204>
				</EQD02>
				<EQD03>
					<EQD0301><!--8155: Equipment size and type identification--></EQD0301>
					<EQD0302><!--1131: Code list qualifier--></EQD0302>
					<EQD0303><!--3055: Code list responsible agency, coded--></EQD0303>
					<EQD0304><!--8154: Equipment size and type--></EQD0304>
				</EQD03>
				<EQD04><!--8077: EQUIPMENT SUPPLIER, CODED--></EQD04>
				<EQD05><!--8249: EQUIPMENT STATUS, CODED--></EQD05>
				<EQD06><!--8169: FULL/EMPTY INDICATOR, CODED--></EQD06>
			</EQD>
			<HAN>
				<HAN01>
					<HAN0101><!--4079: Handling instructions, coded--></HAN0101>
					<HAN0102><!--1131: Code list qualifier--></HAN0102>
					<HAN0103><!--3055: Code list responsible agency, coded--></HAN0103>
					<HAN0104><!--4078: Handling instructions--></HAN0104>
				</HAN01>
				<HAN02>
					<HAN0201><!--7419: Hazardous material class code, identification--></HAN0201>
					<HAN0202><!--1131: Code list qualifier--></HAN0202>
					<HAN0203><!--3055: Code list responsible agency, coded--></HAN0203>
				</HAN02>
			</HAN>
			<MEA>
				<MEA01><!--6311: MEASUREMENT APPLICATION QUALIFIER--></MEA01>
				<MEA02>
					<MEA0201><!--6313: Measurement dimension, coded--></MEA0201>
					<MEA0202><!--6321: Measurement significance, coded--></MEA0202>
					<MEA0203><!--6155: Measurement attribute, coded--></MEA0203>
					<MEA0204><!--6154: Measurement attribute--></MEA0204>
				</MEA02>
				<MEA03>
					<MEA0301><!--6411: Measure unit qualifier--></MEA0301>
					<MEA0302><!--6314: Measurement value--></MEA0302>
					<MEA0303><!--6162: Range minimum--></MEA0303>
					<MEA0304><!--6152: Range maximum--></MEA0304>
					<MEA0305><!--6432: Significant digits--></MEA0305>
				</MEA03>
				<MEA04><!--7383: SURFACE/LAYER INDICATOR, CODED--></MEA04>
			</MEA>
			<FTX>
				<FTX01><!--4451: TEXT SUBJECT QUALIFIER--></FTX01>
				<FTX02><!--4453: TEXT FUNCTION, CODED--></FTX02>
				<FTX03>
					<FTX0301><!--4441: Free text, coded--></FTX0301>
					<FTX0302><!--1131: Code list qualifier--></FTX0302>
					<FTX0303><!--3055: Code list responsible agency, coded--></FTX0303>
				</FTX03>
				<FTX04>
					<FTX0401><!--4440: Free text--></FTX0401>
					<FTX0402><!--4440: Free text--></FTX0402>
					<FTX0403><!--4440: Free text--></FTX0403>
					<FTX0404><!--4440: Free text--></FTX0404>
					<FTX0405><!--4440: Free text--></FTX0405>
				</FTX04>
				<FTX05><!--3453: Language, coded--></FTX05>
			</FTX>
		</GROUP_14>
		<GROUP_15>
			<SCC>
				<SCC01><!--4017: DELIVERY PLAN STATUS INDICATOR, CODED--></SCC01>
				<SCC02><!--4493: DELIVERY REQUIREMENTS, CODED--></SCC02>
				<SCC03>
					<SCC0301><!--2013: Frequency, coded--></SCC0301>
					<SCC0302><!--2015: Despatch pattern, coded--></SCC0302>
					<SCC0303><!--2017: Despatch pattern timing, coded--></SCC0303>
				</SCC03>
			</SCC>
			<FTX>
				<FTX01><!--4451: TEXT SUBJECT QUALIFIER--></FTX01>
				<FTX02><!--4453: TEXT FUNCTION, CODED--></FTX02>
				<FTX03>
					<FTX0301><!--4441: Free text, coded--></FTX0301>
					<FTX0302><!--1131: Code list qualifier--></FTX0302>
					<FTX0303><!--3055: Code list responsible agency, coded--></FTX0303>
				</FTX03>
				<FTX04>
					<FTX0401><!--4440: Free text--></FTX0401>
					<FTX0402><!--4440: Free text--></FTX0402>
					<FTX0403><!--4440: Free text--></FTX0403>
					<FTX0404><!--4440: Free text--></FTX0404>
					<FTX0405><!--4440: Free text--></FTX0405>
				</FTX04>
				<FTX05><!--3453: Language, coded--></FTX05>
			</FTX>
			<RFF>
				<RFF01>
					<RFF0101><!--1153: Reference qualifier--></RFF0101>
					<RFF0102><!--1154: Reference number--></RFF0102>
					<RFF0103><!--1156: Line number--></RFF0103>
					<RFF0104><!--4000: Reference version number--></RFF0104>
				</RFF01>
			</RFF>
			<GROUP_16>
				<QTY>
					<QTY01>
						<QTY0101><!--6063: Quantity qualifier--></QTY0101>
						<QTY0102><!--6060: Quantity--></QTY0102>
						<QTY0103><!--6411: Measure unit qualifier--></QTY0103>
					</QTY01>
				</QTY>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
			</GROUP_16>
		</GROUP_15>
		<GROUP_17>
			<APR>
				<APR01><!--4043: CLASS OF TRADE, CODED--></APR01>
				<APR02>
					<APR0201><!--5394: Price multiplier--></APR0201>
					<APR0202><!--5393: Price multiplier qualifier--></APR0202>
				</APR02>
				<APR03>
					<APR0301><!--4295: Change reason, coded--></APR0301>
					<APR0302><!--1131: Code list qualifier--></APR0302>
					<APR0303><!--3055: Code list responsible agency, coded--></APR0303>
					<APR0304><!--4294: Change reason--></APR0304>
				</APR03>
			</APR>
			<DTM>
				<DTM01>
					<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
					<DTM0102><!--2380: Date/time/period--></DTM0102>
					<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
				</DTM01>
			</DTM>
			<RNG>
				<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
				<RNG02>
					<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
					<RNG0202><!--6162: Range minimum--></RNG0202>
					<RNG0203><!--6152: Range maximum--></RNG0203>
				</RNG02>
			</RNG>
		</GROUP_17>
		<GROUP_18>
			<ALC>
				<ALC01><!--5463: ALLOWANCE OR CHARGE QUALIFIER--></ALC01>
				<ALC02>
					<ALC0201><!--1230: Allowance or charge number--></ALC0201>
					<ALC0202><!--5189: Charge/allowance description, coded--></ALC0202>
				</ALC02>
				<ALC03><!--4471: SETTLEMENT, CODED--></ALC03>
				<ALC04><!--1227: CALCULATION SEQUENCE INDICATOR, CODED--></ALC04>
				<ALC05>
					<ALC0501><!--7161: Special services, coded--></ALC0501>
					<ALC0502><!--1131: Code list qualifier--></ALC0502>
					<ALC0503><!--3055: Code list responsible agency, coded--></ALC0503>
					<ALC0504><!--7160: Special service--></ALC0504>
					<ALC0505><!--7160: Special service--></ALC0505>
				</ALC05>
			</ALC>
			<ALI>
				<ALI01><!--3239: COUNTRY OF ORIGIN, CODED--></ALI01>
				<ALI02><!--9213: TYPE OF DUTY REGIME, CODED--></ALI02>
				<ALI03><!--4183: SPECIAL CONDITIONS, CODED--></ALI03>
				<ALI04><!--4183: SPECIAL CONDITIONS, CODED--></ALI04>
				<ALI05><!--4183: SPECIAL CONDITIONS, CODED--></ALI05>
				<ALI06><!--4183: SPECIAL CONDITIONS, CODED--></ALI06>
				<ALI07><!--4183: SPECIAL CONDITIONS, CODED--></ALI07>
			</ALI>
			<DTM>
				<DTM01>
					<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
					<DTM0102><!--2380: Date/time/period--></DTM0102>
					<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
				</DTM01>
			</DTM>
			<GROUP_19>
				<QTY>
					<QTY01>
						<QTY0101><!--6063: Quantity qualifier--></QTY0101>
						<QTY0102><!--6060: Quantity--></QTY0102>
						<QTY0103><!--6411: Measure unit qualifier--></QTY0103>
					</QTY01>
				</QTY>
				<RNG>
					<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
					<RNG02>
						<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
						<RNG0202><!--6162: Range minimum--></RNG0202>
						<RNG0203><!--6152: Range maximum--></RNG0203>
					</RNG02>
				</RNG>
			</GROUP_19>
			<GROUP_20>
				<PCD>
					<PCD01>
						<PCD0101><!--5245: Percentage qualifier--></PCD0101>
						<PCD0102><!--5482: Percentage--></PCD0102>
						<PCD0103><!--5249: Percentage basis, coded--></PCD0103>
						<PCD0104><!--1131: Code list qualifier--></PCD0104>
						<PCD0105><!--3055: Code list responsible agency, coded--></PCD0105>
					</PCD01>
				</PCD>
				<RNG>
					<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
					<RNG02>
						<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
						<RNG0202><!--6162: Range minimum--></RNG0202>
						<RNG0203><!--6152: Range maximum--></RNG0203>
					</RNG02>
				</RNG>
			</GROUP_20>
			<GROUP_21>
				<MOA>
					<MOA01>
						<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
						<MOA0102><!--5004: Monetary amount--></MOA0102>
						<MOA0103><!--6345: Currency, coded--></MOA0103>
						<MOA0104><!--6343: Currency qualifier--></MOA0104>
						<MOA0105><!--4405: Status, coded--></MOA0105>
					</MOA01>
				</MOA>
				<RNG>
					<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
					<RNG02>
						<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
						<RNG0202><!--6162: Range minimum--></RNG0202>
						<RNG0203><!--6152: Range maximum--></RNG0203>
					</RNG02>
				</RNG>
			</GROUP_21>
			<GROUP_22>
				<RTE>
					<RTE01>
						<RTE0101><!--5419: Rate type qualifier--></RTE0101>
						<RTE0102><!--5420: Rate per unit--></RTE0102>
						<RTE0103><!--5284: Unit price basis--></RTE0103>
						<RTE0104><!--6411: Measure unit qualifier--></RTE0104>
					</RTE01>
				</RTE>
				<RNG>
					<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
					<RNG02>
						<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
						<RNG0202><!--6162: Range minimum--></RNG0202>
						<RNG0203><!--6152: Range maximum--></RNG0203>
					</RNG02>
				</RNG>
			</GROUP_22>
			<GROUP_23>
				<TAX>
					<TAX01><!--5283: DUTY/TAX/FEE FUNCTION QUALIFIER--></TAX01>
					<TAX02>
						<TAX0201><!--5153: Duty/tax/fee type, coded--></TAX0201>
						<TAX0202><!--1131: Code list qualifier--></TAX0202>
						<TAX0203><!--3055: Code list responsible agency, coded--></TAX0203>
						<TAX0204><!--5152: Duty/tax/fee type--></TAX0204>
					</TAX02>
					<TAX03>
						<TAX0301><!--5289: Duty/tax/fee account identification--></TAX0301>
						<TAX0302><!--1131: Code list qualifier--></TAX0302>
						<TAX0303><!--3055: Code list responsible agency, coded--></TAX0303>
					</TAX03>
					<TAX04><!--5286: DUTY/TAX/FEE ASSESSMENT BASIS--></TAX04>
					<TAX05>
						<TAX0501><!--5279: Duty/tax/fee rate identification--></TAX0501>
						<TAX0502><!--1131: Code list qualifier--></TAX0502>
						<TAX0503><!--3055: Code list responsible agency, coded--></TAX0503>
						<TAX0504><!--5278: Duty/tax/fee rate--></TAX0504>
						<TAX0505><!--5273: Duty/tax/fee rate basis identification--></TAX0505>
						<TAX0506><!--1131: Code list qualifier--></TAX0506>
						<TAX0507><!--3055: Code list responsible agency, coded--></TAX0507>
					</TAX05>
					<TAX06><!--5305: DUTY/TAX/FEE CATEGORY, CODED--></TAX06>
					<TAX07><!--3446: PARTY TAX IDENTIFICATION NUMBER--></TAX07>
				</TAX>
				<MOA>
					<MOA01>
						<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
						<MOA0102><!--5004: Monetary amount--></MOA0102>
						<MOA0103><!--6345: Currency, coded--></MOA0103>
						<MOA0104><!--6343: Currency qualifier--></MOA0104>
						<MOA0105><!--4405: Status, coded--></MOA0105>
					</MOA01>
				</MOA>
			</GROUP_23>
		</GROUP_18>
		<GROUP_24>
			<RCS>
				<RCS01><!--7293: SECTOR/SUBJECT IDENTIFICATION QUALIFIER--></RCS01>
				<RCS02>
					<RCS0201><!--7295: Requirement/condition identification--></RCS0201>
					<RCS0202><!--1131: Code list qualifier--></RCS0202>
					<RCS0203><!--3055: Code list responsible agency, coded--></RCS0203>
					<RCS0204><!--7294: Requirement or condition--></RCS0204>
				</RCS02>
				<RCS03><!--1229: Action request/notification, coded--></RCS03>
			</RCS>
			<RFF>
				<RFF01>
					<RFF0101><!--1153: Reference qualifier--></RFF0101>
					<RFF0102><!--1154: Reference number--></RFF0102>
					<RFF0103><!--1156: Line number--></RFF0103>
					<RFF0104><!--4000: Reference version number--></RFF0104>
				</RFF01>
			</RFF>
			<DTM>
				<DTM01>
					<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
					<DTM0102><!--2380: Date/time/period--></DTM0102>
					<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
				</DTM01>
			</DTM>
			<FTX>
				<FTX01><!--4451: TEXT SUBJECT QUALIFIER--></FTX01>
				<FTX02><!--4453: TEXT FUNCTION, CODED--></FTX02>
				<FTX03>
					<FTX0301><!--4441: Free text, coded--></FTX0301>
					<FTX0302><!--1131: Code list qualifier--></FTX0302>
					<FTX0303><!--3055: Code list responsible agency, coded--></FTX0303>
				</FTX03>
				<FTX04>
					<FTX0401><!--4440: Free text--></FTX0401>
					<FTX0402><!--4440: Free text--></FTX0402>
					<FTX0403><!--4440: Free text--></FTX0403>
					<FTX0404><!--4440: Free text--></FTX0404>
					<FTX0405><!--4440: Free text--></FTX0405>
				</FTX04>
				<FTX05><!--3453: Language, coded--></FTX05>
			</FTX>
		</GROUP_24>
		<GROUP_25>
			<LIN>
				<LIN01><!--1082: LINE ITEM NUMBER--></LIN01>
				<LIN02><!--1229: Action request/notification, coded--></LIN02>
				<LIN03>
					<LIN0301><!--7140: ITEM NUMBER--></LIN0301>
					<LIN0302><!--7143: Item number type, coded--></LIN0302>
					<LIN0303><!--1131: Code list qualifier--></LIN0303>
					<LIN0304><!--3055: Code list responsible agency, coded--></LIN0304>
				</LIN03>
				<LIN04>
					<LIN0401><!--5495: SUB-LINE INDICATOR, CODED--></LIN0401>
					<LIN0402><!--1082: LINE ITEM NUMBER--></LIN0402>
				</LIN04>
				<LIN05><!--1222: CONFIGURATION LEVEL--></LIN05>
				<LIN06><!--7083: CONFIGURATION, CODED--></LIN06>
			</LIN>
			<PIA>
				<PIA01><!--4347: PRODUCT ID. FUNCTION QUALIFIER--></PIA01>
				<PIA02>
					<PIA0201><!--7140: ITEM NUMBER--></PIA0201>
					<PIA0202><!--7143: Item number type, coded--></PIA0202>
					<PIA0203><!--1131: Code list qualifier--></PIA0203>
					<PIA0204><!--3055: Code list responsible agency, coded--></PIA0204>
				</PIA02>
				<PIA03>
					<PIA0301><!--7140: ITEM NUMBER--></PIA0301>
					<PIA0302><!--7143: Item number type, coded--></PIA0302>
					<PIA0303><!--1131: Code list qualifier--></PIA0303>
					<PIA0304><!--3055: Code list responsible agency, coded--></PIA0304>
				</PIA03>
				<PIA04>
					<PIA0401><!--7140: ITEM NUMBER--></PIA0401>
					<PIA0402><!--7143: Item number type, coded--></PIA0402>
					<PIA0403><!--1131: Code list qualifier--></PIA0403>
					<PIA0404><!--3055: Code list responsible agency, coded--></PIA0404>
				</PIA04>
				<PIA05>
					<PIA0501><!--7140: ITEM NUMBER--></PIA0501>
					<PIA0502><!--7143: Item number type, coded--></PIA0502>
					<PIA0503><!--1131: Code list qualifier--></PIA0503>
					<PIA0504><!--3055: Code list responsible agency, coded--></PIA0504>
				</PIA05>
				<PIA06>
					<PIA0601><!--7140: ITEM NUMBER--></PIA0601>
					<PIA0602><!--7143: Item number type, coded--></PIA0602>
					<PIA0603><!--1131: Code list qualifier--></PIA0603>
					<PIA0604><!--3055: Code list responsible agency, coded--></PIA0604>
				</PIA06>
			</PIA>
			<IMD>
				<IMD01><!--7077: ITEM DESCRIPTION TYPE, CODED--></IMD01>
				<IMD02><!--7081: ITEM CHARACTERISTIC, CODED--></IMD02>
				<IMD03>
					<IMD0301><!--7009: Item description identification--></IMD0301>
					<IMD0302><!--1131: Code list qualifier--></IMD0302>
					<IMD0303><!--3055: Code list responsible agency, coded--></IMD0303>
					<IMD0304><!--7008: Item description--></IMD0304>
					<IMD0305><!--7008: Item description--></IMD0305>
					<IMD0306><!--3453: Language, coded--></IMD0306>
				</IMD03>
				<IMD04><!--7383: SURFACE/LAYER INDICATOR, CODED--></IMD04>
			</IMD>
			<MEA>
				<MEA01><!--6311: MEASUREMENT APPLICATION QUALIFIER--></MEA01>
				<MEA02>
					<MEA0201><!--6313: Measurement dimension, coded--></MEA0201>
					<MEA0202><!--6321: Measurement significance, coded--></MEA0202>
					<MEA0203><!--6155: Measurement attribute, coded--></MEA0203>
					<MEA0204><!--6154: Measurement attribute--></MEA0204>
				</MEA02>
				<MEA03>
					<MEA0301><!--6411: Measure unit qualifier--></MEA0301>
					<MEA0302><!--6314: Measurement value--></MEA0302>
					<MEA0303><!--6162: Range minimum--></MEA0303>
					<MEA0304><!--6152: Range maximum--></MEA0304>
					<MEA0305><!--6432: Significant digits--></MEA0305>
				</MEA03>
				<MEA04><!--7383: SURFACE/LAYER INDICATOR, CODED--></MEA04>
			</MEA>
			<QTY>
				<QTY01>
					<QTY0101><!--6063: Quantity qualifier--></QTY0101>
					<QTY0102><!--6060: Quantity--></QTY0102>
					<QTY0103><!--6411: Measure unit qualifier--></QTY0103>
				</QTY01>
			</QTY>
			<PCD>
				<PCD01>
					<PCD0101><!--5245: Percentage qualifier--></PCD0101>
					<PCD0102><!--5482: Percentage--></PCD0102>
					<PCD0103><!--5249: Percentage basis, coded--></PCD0103>
					<PCD0104><!--1131: Code list qualifier--></PCD0104>
					<PCD0105><!--3055: Code list responsible agency, coded--></PCD0105>
				</PCD01>
			</PCD>
			<ALI>
				<ALI01><!--3239: COUNTRY OF ORIGIN, CODED--></ALI01>
				<ALI02><!--9213: TYPE OF DUTY REGIME, CODED--></ALI02>
				<ALI03><!--4183: SPECIAL CONDITIONS, CODED--></ALI03>
				<ALI04><!--4183: SPECIAL CONDITIONS, CODED--></ALI04>
				<ALI05><!--4183: SPECIAL CONDITIONS, CODED--></ALI05>
				<ALI06><!--4183: SPECIAL CONDITIONS, CODED--></ALI06>
				<ALI07><!--4183: SPECIAL CONDITIONS, CODED--></ALI07>
			</ALI>
			<DTM>
				<DTM01>
					<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
					<DTM0102><!--2380: Date/time/period--></DTM0102>
					<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
				</DTM01>
			</DTM>
			<MOA>
				<MOA01>
					<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
					<MOA0102><!--5004: Monetary amount--></MOA0102>
					<MOA0103><!--6345: Currency, coded--></MOA0103>
					<MOA0104><!--6343: Currency qualifier--></MOA0104>
					<MOA0105><!--4405: Status, coded--></MOA0105>
				</MOA01>
			</MOA>
			<GIN>
				<GIN01><!--7405: Identity number qualifier--></GIN01>
				<GIN02>
					<GIN0201><!--7402: Identity number--></GIN0201>
					<GIN0202><!--7402: Identity number--></GIN0202>
				</GIN02>
				<GIN03>
					<GIN0301><!--7402: Identity number--></GIN0301>
					<GIN0302><!--7402: Identity number--></GIN0302>
				</GIN03>
				<GIN04>
					<GIN0401><!--7402: Identity number--></GIN0401>
					<GIN0402><!--7402: Identity number--></GIN0402>
				</GIN04>
				<GIN05>
					<GIN0501><!--7402: Identity number--></GIN0501>
					<GIN0502><!--7402: Identity number--></GIN0502>
				</GIN05>
				<GIN06>
					<GIN0601><!--7402: Identity number--></GIN0601>
					<GIN0602><!--7402: Identity number--></GIN0602>
				</GIN06>
			</GIN>
			<GIR>
				<GIR01><!--7297: SET IDENTIFICATION QUALIFIER--></GIR01>
				<GIR02>
					<GIR0201><!--7402: Identity number--></GIR0201>
					<GIR0202><!--7405: Identity number qualifier--></GIR0202>
					<GIR0203><!--4405: Status, coded--></GIR0203>
				</GIR02>
				<GIR03>
					<GIR0301><!--7402: Identity number--></GIR0301>
					<GIR0302><!--7405: Identity number qualifier--></GIR0302>
					<GIR0303><!--4405: Status, coded--></GIR0303>
				</GIR03>
				<GIR04>
					<GIR0401><!--7402: Identity number--></GIR0401>
					<GIR0402><!--7405: Identity number qualifier--></GIR0402>
					<GIR0403><!--4405: Status, coded--></GIR0403>
				</GIR04>
				<GIR05>
					<GIR0501><!--7402: Identity number--></GIR0501>
					<GIR0502><!--7405: Identity number qualifier--></GIR0502>
					<GIR0503><!--4405: Status, coded--></GIR0503>
				</GIR05>
				<GIR06>
					<GIR0601><!--7402: Identity number--></GIR0601>
					<GIR0602><!--7405: Identity number qualifier--></GIR0602>
					<GIR0603><!--4405: Status, coded--></GIR0603>
				</GIR06>
			</GIR>
			<QVR>
				<QVR01>
					<QVR0101><!--6064: Quantity difference--></QVR0101>
					<QVR0102><!--6063: Quantity qualifier--></QVR0102>
				</QVR01>
				<QVR02><!--4221: DISCREPANCY, CODED--></QVR02>
				<QVR03>
					<QVR0301><!--4295: Change reason, coded--></QVR0301>
					<QVR0302><!--1131: Code list qualifier--></QVR0302>
					<QVR0303><!--3055: Code list responsible agency, coded--></QVR0303>
					<QVR0304><!--4294: Change reason--></QVR0304>
				</QVR03>
			</QVR>
			<DOC>
				<DOC01>
					<DOC0101><!--1001: DOCUMENT/MESSAGE NAME, CODED--></DOC0101>
					<DOC0102><!--1131: Code list qualifier--></DOC0102>
					<DOC0103><!--3055: Code list responsible agency, coded--></DOC0103>
					<DOC0104><!--1000: Document/message name--></DOC0104>
				</DOC01>
				<DOC02>
					<DOC0201><!--1004: Document/message number--></DOC0201>
					<DOC0202><!--1373: Document/message status, coded--></DOC0202>
					<DOC0203><!--1366: Document/message source--></DOC0203>
					<DOC0204><!--3453: Language, coded--></DOC0204>
				</DOC02>
				<DOC03><!--3153: COMMUNICATION CHANNEL IDENTIFIER, CODED--></DOC03>
				<DOC04><!--1220: NUMBER OF COPIES OF DOCUMENT REQUIRED--></DOC04>
				<DOC05><!--1218: NUMBER OF ORIGINALS OF DOCUMENT REQUIRED--></DOC05>
			</DOC>
			<PAI>
				<PAI01>
					<PAI0101><!--4439: Payment conditions, coded--></PAI0101>
					<PAI0102><!--4431: Payment guarantee, coded--></PAI0102>
					<PAI0103><!--4461: Payment means, coded--></PAI0103>
					<PAI0104><!--1131: Code list qualifier--></PAI0104>
					<PAI0105><!--3055: Code list responsible agency, coded--></PAI0105>
					<PAI0106><!--4435: Payment channel, coded--></PAI0106>
				</PAI01>
			</PAI>
			<FTX>
				<FTX01><!--4451: TEXT SUBJECT QUALIFIER--></FTX01>
				<FTX02><!--4453: TEXT FUNCTION, CODED--></FTX02>
				<FTX03>
					<FTX0301><!--4441: Free text, coded--></FTX0301>
					<FTX0302><!--1131: Code list qualifier--></FTX0302>
					<FTX0303><!--3055: Code list responsible agency, coded--></FTX0303>
				</FTX03>
				<FTX04>
					<FTX0401><!--4440: Free text--></FTX0401>
					<FTX0402><!--4440: Free text--></FTX0402>
					<FTX0403><!--4440: Free text--></FTX0403>
					<FTX0404><!--4440: Free text--></FTX0404>
					<FTX0405><!--4440: Free text--></FTX0405>
				</FTX04>
				<FTX05><!--3453: Language, coded--></FTX05>
			</FTX>
			<GROUP_26>
				<CCI>
					<CCI01><!--7059: PROPERTY CLASS, CODED--></CCI01>
					<CCI02>
						<CCI0201><!--6313: Measurement dimension, coded--></CCI0201>
						<CCI0202><!--6321: Measurement significance, coded--></CCI0202>
						<CCI0203><!--6155: Measurement attribute, coded--></CCI0203>
						<CCI0204><!--6154: Measurement attribute--></CCI0204>
					</CCI02>
					<CCI03>
						<CCI0301><!--7037: Characteristic identification--></CCI0301>
						<CCI0302><!--1131: Code list qualifier--></CCI0302>
						<CCI0303><!--3055: Code list responsible agency, coded--></CCI0303>
						<CCI0304><!--7036: Characteristic--></CCI0304>
						<CCI0305><!--7036: Characteristic--></CCI0305>
					</CCI03>
				</CCI>
				<CAV>
					<CAV01>
						<CAV0101><!--7111: Characteristic value, coded--></CAV0101>
						<CAV0102><!--1131: Code list qualifier--></CAV0102>
						<CAV0103><!--3055: Code list responsible agency, coded--></CAV0103>
						<CAV0104><!--7110: Characteristic value--></CAV0104>
						<CAV0105><!--7110: Characteristic value--></CAV0105>
					</CAV01>
				</CAV>
				<MEA>
					<MEA01><!--6311: MEASUREMENT APPLICATION QUALIFIER--></MEA01>
					<MEA02>
						<MEA0201><!--6313: Measurement dimension, coded--></MEA0201>
						<MEA0202><!--6321: Measurement significance, coded--></MEA0202>
						<MEA0203><!--6155: Measurement attribute, coded--></MEA0203>
						<MEA0204><!--6154: Measurement attribute--></MEA0204>
					</MEA02>
					<MEA03>
						<MEA0301><!--6411: Measure unit qualifier--></MEA0301>
						<MEA0302><!--6314: Measurement value--></MEA0302>
						<MEA0303><!--6162: Range minimum--></MEA0303>
						<MEA0304><!--6152: Range maximum--></MEA0304>
						<MEA0305><!--6432: Significant digits--></MEA0305>
					</MEA03>
					<MEA04><!--7383: SURFACE/LAYER INDICATOR, CODED--></MEA04>
				</MEA>
			</GROUP_26>
			<GROUP_27>
				<PAT>
					<PAT01><!--4279: PAYMENT TERMS TYPE QUALIFIER--></PAT01>
					<PAT02>
						<PAT0201><!--4277: Terms of payment identification--></PAT0201>
						<PAT0202><!--1131: Code list qualifier--></PAT0202>
						<PAT0203><!--3055: Code list responsible agency, coded--></PAT0203>
						<PAT0204><!--4276: Terms of payment--></PAT0204>
						<PAT0205><!--4276: Terms of payment--></PAT0205>
					</PAT02>
					<PAT03>
						<PAT0301><!--2475: Payment time reference, coded--></PAT0301>
						<PAT0302><!--2009: Time relation, coded--></PAT0302>
						<PAT0303><!--2151: Type of period, coded--></PAT0303>
						<PAT0304><!--2152: Number of periods--></PAT0304>
					</PAT03>
				</PAT>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
				<PCD>
					<PCD01>
						<PCD0101><!--5245: Percentage qualifier--></PCD0101>
						<PCD0102><!--5482: Percentage--></PCD0102>
						<PCD0103><!--5249: Percentage basis, coded--></PCD0103>
						<PCD0104><!--1131: Code list qualifier--></PCD0104>
						<PCD0105><!--3055: Code list responsible agency, coded--></PCD0105>
					</PCD01>
				</PCD>
				<MOA>
					<MOA01>
						<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
						<MOA0102><!--5004: Monetary amount--></MOA0102>
						<MOA0103><!--6345: Currency, coded--></MOA0103>
						<MOA0104><!--6343: Currency qualifier--></MOA0104>
						<MOA0105><!--4405: Status, coded--></MOA0105>
					</MOA01>
				</MOA>
			</GROUP_27>
			<GROUP_28>
				<PRI>
					<PRI01>
						<PRI0101><!--5125: Price qualifier--></PRI0101>
						<PRI0102><!--5118: Price--></PRI0102>
						<PRI0103><!--5375: Price type, coded--></PRI0103>
						<PRI0104><!--5387: Price type qualifier--></PRI0104>
						<PRI0105><!--5284: Unit price basis--></PRI0105>
						<PRI0106><!--6411: Measure unit qualifier--></PRI0106>
					</PRI01>
					<PRI02><!--5213: SUB-LINE PRICE CHANGE, CODED--></PRI02>
				</PRI>
				<CUX>
					<CUX01>
						<CUX0101><!--6347: Currency details qualifier--></CUX0101>
						<CUX0102><!--6345: Currency, coded--></CUX0102>
						<CUX0103><!--6343: Currency qualifier--></CUX0103>
						<CUX0104><!--6348: Currency rate base--></CUX0104>
					</CUX01>
					<CUX02>
						<CUX0201><!--6347: Currency details qualifier--></CUX0201>
						<CUX0202><!--6345: Currency, coded--></CUX0202>
						<CUX0203><!--6343: Currency qualifier--></CUX0203>
						<CUX0204><!--6348: Currency rate base--></CUX0204>
					</CUX02>
					<CUX03><!--5402: RATE OF EXCHANGE--></CUX03>
					<CUX04><!--6341: CURRENCY MARKET EXCHANGE, CODED--></CUX04>
				</CUX>
				<APR>
					<APR01><!--4043: CLASS OF TRADE, CODED--></APR01>
					<APR02>
						<APR0201><!--5394: Price multiplier--></APR0201>
						<APR0202><!--5393: Price multiplier qualifier--></APR0202>
					</APR02>
					<APR03>
						<APR0301><!--4295: Change reason, coded--></APR0301>
						<APR0302><!--1131: Code list qualifier--></APR0302>
						<APR0303><!--3055: Code list responsible agency, coded--></APR0303>
						<APR0304><!--4294: Change reason--></APR0304>
					</APR03>
				</APR>
				<RNG>
					<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
					<RNG02>
						<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
						<RNG0202><!--6162: Range minimum--></RNG0202>
						<RNG0203><!--6152: Range maximum--></RNG0203>
					</RNG02>
				</RNG>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
			</GROUP_28>
			<GROUP_29>
				<RFF>
					<RFF01>
						<RFF0101><!--1153: Reference qualifier--></RFF0101>
						<RFF0102><!--1154: Reference number--></RFF0102>
						<RFF0103><!--1156: Line number--></RFF0103>
						<RFF0104><!--4000: Reference version number--></RFF0104>
					</RFF01>
				</RFF>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
			</GROUP_29>
			<GROUP_30>
				<PAC>
					<PAC01><!--7224: NUMBER OF PACKAGES--></PAC01>
					<PAC02>
						<PAC0201><!--7075: Packaging level, coded--></PAC0201>
						<PAC0202><!--7233: Packaging related information, coded--></PAC0202>
						<PAC0203><!--7073: Packaging terms and conditions, coded--></PAC0203>
					</PAC02>
					<PAC03>
						<PAC0301><!--7065: Type of packages identification--></PAC0301>
						<PAC0302><!--1131: Code list qualifier--></PAC0302>
						<PAC0303><!--3055: Code list responsible agency, coded--></PAC0303>
						<PAC0304><!--7064: Type of packages--></PAC0304>
					</PAC03>
					<PAC04>
						<PAC0401><!--7077: ITEM DESCRIPTION TYPE, CODED--></PAC0401>
						<PAC0402><!--7064: Type of packages--></PAC0402>
						<PAC0403><!--7143: Item number type, coded--></PAC0403>
						<PAC0404><!--7064: Type of packages--></PAC0404>
						<PAC0405><!--7143: Item number type, coded--></PAC0405>
					</PAC04>
					<PAC05>
						<PAC0501><!--8395: Returnable package freight payment--></PAC0501>
						<PAC0502><!--8393: Returnable package load contents code--></PAC0502>
					</PAC05>
				</PAC>
				<MEA>
					<MEA01><!--6311: MEASUREMENT APPLICATION QUALIFIER--></MEA01>
					<MEA02>
						<MEA0201><!--6313: Measurement dimension, coded--></MEA0201>
						<MEA0202><!--6321: Measurement significance, coded--></MEA0202>
						<MEA0203><!--6155: Measurement attribute, coded--></MEA0203>
						<MEA0204><!--6154: Measurement attribute--></MEA0204>
					</MEA02>
					<MEA03>
						<MEA0301><!--6411: Measure unit qualifier--></MEA0301>
						<MEA0302><!--6314: Measurement value--></MEA0302>
						<MEA0303><!--6162: Range minimum--></MEA0303>
						<MEA0304><!--6152: Range maximum--></MEA0304>
						<MEA0305><!--6432: Significant digits--></MEA0305>
					</MEA03>
					<MEA04><!--7383: SURFACE/LAYER INDICATOR, CODED--></MEA04>
				</MEA>
				<QTY>
					<QTY01>
						<QTY0101><!--6063: Quantity qualifier--></QTY0101>
						<QTY0102><!--6060: Quantity--></QTY0102>
						<QTY0103><!--6411: Measure unit qualifier--></QTY0103>
					</QTY01>
				</QTY>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
				<GROUP_31>
					<RFF>
						<RFF01>
							<RFF0101><!--1153: Reference qualifier--></RFF0101>
							<RFF0102><!--1154: Reference number--></RFF0102>
							<RFF0103><!--1156: Line number--></RFF0103>
							<RFF0104><!--4000: Reference version number--></RFF0104>
						</RFF01>
					</RFF>
					<DTM>
						<DTM01>
							<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
							<DTM0102><!--2380: Date/time/period--></DTM0102>
							<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
						</DTM01>
					</DTM>
				</GROUP_31>
				<GROUP_32>
					<PCI>
						<PCI01><!--4233: MARKING INSTRUCTIONS, CODED--></PCI01>
						<PCI02>
							<PCI0201><!--7102: Shipping marks--></PCI0201>
							<PCI0202><!--7102: Shipping marks--></PCI0202>
							<PCI0203><!--7102: Shipping marks--></PCI0203>
							<PCI0204><!--7102: Shipping marks--></PCI0204>
							<PCI0205><!--7102: Shipping marks--></PCI0205>
							<PCI0206><!--7102: Shipping marks--></PCI0206>
							<PCI0207><!--7102: Shipping marks--></PCI0207>
							<PCI0208><!--7102: Shipping marks--></PCI0208>
							<PCI0209><!--7102: Shipping marks--></PCI0209>
							<PCI0210><!--7102: Shipping marks--></PCI0210>
						</PCI02>
						<PCI03><!--8275: CONTAINER/PACKAGE STATUS, CODED--></PCI03>
						<PCI04>
							<PCI0401><!--7511: Type of marking, coded--></PCI0401>
							<PCI0402><!--1131: Code list qualifier--></PCI0402>
							<PCI0403><!--3055: Code list responsible agency, coded--></PCI0403>
						</PCI04>
					</PCI>
					<RFF>
						<RFF01>
							<RFF0101><!--1153: Reference qualifier--></RFF0101>
							<RFF0102><!--1154: Reference number--></RFF0102>
							<RFF0103><!--1156: Line number--></RFF0103>
							<RFF0104><!--4000: Reference version number--></RFF0104>
						</RFF01>
					</RFF>
					<DTM>
						<DTM01>
							<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
							<DTM0102><!--2380: Date/time/period--></DTM0102>
							<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
						</DTM01>
					</DTM>
					<GIN>
						<GIN01><!--7405: Identity number qualifier--></GIN01>
						<GIN02>
							<GIN0201><!--7402: Identity number--></GIN0201>
							<GIN0202><!--7402: Identity number--></GIN0202>
						</GIN02>
						<GIN03>
							<GIN0301><!--7402: Identity number--></GIN0301>
							<GIN0302><!--7402: Identity number--></GIN0302>
						</GIN03>
						<GIN04>
							<GIN0401><!--7402: Identity number--></GIN0401>
							<GIN0402><!--7402: Identity number--></GIN0402>
						</GIN04>
						<GIN05>
							<GIN0501><!--7402: Identity number--></GIN0501>
							<GIN0502><!--7402: Identity number--></GIN0502>
						</GIN05>
						<GIN06>
							<GIN0601><!--7402: Identity number--></GIN0601>
							<GIN0602><!--7402: Identity number--></GIN0602>
						</GIN06>
					</GIN>
				</GROUP_32>
			</GROUP_30>
			<GROUP_33>
				<LOC>
					<LOC01><!--3227: PLACE/LOCATION QUALIFIER--></LOC01>
					<LOC02>
						<LOC0201><!--3225: Place/location identification--></LOC0201>
						<LOC0202><!--1131: Code list qualifier--></LOC0202>
						<LOC0203><!--3055: Code list responsible agency, coded--></LOC0203>
						<LOC0204><!--3224: Place/location--></LOC0204>
					</LOC02>
					<LOC03>
						<LOC0301><!--3223: Related place/location one identification--></LOC0301>
						<LOC0302><!--1131: Code list qualifier--></LOC0302>
						<LOC0303><!--3055: Code list responsible agency, coded--></LOC0303>
						<LOC0304><!--3222: Related place/location one--></LOC0304>
					</LOC03>
					<LOC04>
						<LOC0401><!--3233: Related place/location two identification--></LOC0401>
						<LOC0402><!--1131: Code list qualifier--></LOC0402>
						<LOC0403><!--3055: Code list responsible agency, coded--></LOC0403>
						<LOC0404><!--3232: Related place/location two--></LOC0404>
					</LOC04>
					<LOC05><!--5479: RELATION, CODED--></LOC05>
				</LOC>
				<QTY>
					<QTY01>
						<QTY0101><!--6063: Quantity qualifier--></QTY0101>
						<QTY0102><!--6060: Quantity--></QTY0102>
						<QTY0103><!--6411: Measure unit qualifier--></QTY0103>
					</QTY01>
				</QTY>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
			</GROUP_33>
			<GROUP_34>
				<TAX>
					<TAX01><!--5283: DUTY/TAX/FEE FUNCTION QUALIFIER--></TAX01>
					<TAX02>
						<TAX0201><!--5153: Duty/tax/fee type, coded--></TAX0201>
						<TAX0202><!--1131: Code list qualifier--></TAX0202>
						<TAX0203><!--3055: Code list responsible agency, coded--></TAX0203>
						<TAX0204><!--5152: Duty/tax/fee type--></TAX0204>
					</TAX02>
					<TAX03>
						<TAX0301><!--5289: Duty/tax/fee account identification--></TAX0301>
						<TAX0302><!--1131: Code list qualifier--></TAX0302>
						<TAX0303><!--3055: Code list responsible agency, coded--></TAX0303>
					</TAX03>
					<TAX04><!--5286: DUTY/TAX/FEE ASSESSMENT BASIS--></TAX04>
					<TAX05>
						<TAX0501><!--5279: Duty/tax/fee rate identification--></TAX0501>
						<TAX0502><!--1131: Code list qualifier--></TAX0502>
						<TAX0503><!--3055: Code list responsible agency, coded--></TAX0503>
						<TAX0504><!--5278: Duty/tax/fee rate--></TAX0504>
						<TAX0505><!--5273: Duty/tax/fee rate basis identification--></TAX0505>
						<TAX0506><!--1131: Code list qualifier--></TAX0506>
						<TAX0507><!--3055: Code list responsible agency, coded--></TAX0507>
					</TAX05>
					<TAX06><!--5305: DUTY/TAX/FEE CATEGORY, CODED--></TAX06>
					<TAX07><!--3446: PARTY TAX IDENTIFICATION NUMBER--></TAX07>
				</TAX>
				<MOA>
					<MOA01>
						<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
						<MOA0102><!--5004: Monetary amount--></MOA0102>
						<MOA0103><!--6345: Currency, coded--></MOA0103>
						<MOA0104><!--6343: Currency qualifier--></MOA0104>
						<MOA0105><!--4405: Status, coded--></MOA0105>
					</MOA01>
				</MOA>
				<LOC>
					<LOC01><!--3227: PLACE/LOCATION QUALIFIER--></LOC01>
					<LOC02>
						<LOC0201><!--3225: Place/location identification--></LOC0201>
						<LOC0202><!--1131: Code list qualifier--></LOC0202>
						<LOC0203><!--3055: Code list responsible agency, coded--></LOC0203>
						<LOC0204><!--3224: Place/location--></LOC0204>
					</LOC02>
					<LOC03>
						<LOC0301><!--3223: Related place/location one identification--></LOC0301>
						<LOC0302><!--1131: Code list qualifier--></LOC0302>
						<LOC0303><!--3055: Code list responsible agency, coded--></LOC0303>
						<LOC0304><!--3222: Related place/location one--></LOC0304>
					</LOC03>
					<LOC04>
						<LOC0401><!--3233: Related place/location two identification--></LOC0401>
						<LOC0402><!--1131: Code list qualifier--></LOC0402>
						<LOC0403><!--3055: Code list responsible agency, coded--></LOC0403>
						<LOC0404><!--3232: Related place/location two--></LOC0404>
					</LOC04>
					<LOC05><!--5479: RELATION, CODED--></LOC05>
				</LOC>
			</GROUP_34>
			<GROUP_35>
				<NAD>
					<NAD01><!--3035: PARTY QUALIFIER--></NAD01>
					<NAD02>
						<NAD0201><!--3039: Party id. identification--></NAD0201>
						<NAD0202><!--1131: Code list qualifier--></NAD0202>
						<NAD0203><!--3055: Code list responsible agency, coded--></NAD0203>
					</NAD02>
					<NAD03>
						<NAD0301><!--3124: Name and address line--></NAD0301>
						<NAD0302><!--3124: Name and address line--></NAD0302>
						<NAD0303><!--3124: Name and address line--></NAD0303>
						<NAD0304><!--3124: Name and address line--></NAD0304>
						<NAD0305><!--3124: Name and address line--></NAD0305>
					</NAD03>
					<NAD04>
						<NAD0401><!--3036: Party name--></NAD0401>
						<NAD0402><!--3036: Party name--></NAD0402>
						<NAD0403><!--3036: Party name--></NAD0403>
						<NAD0404><!--3036: Party name--></NAD0404>
						<NAD0405><!--3036: Party name--></NAD0405>
						<NAD0406><!--3045: Party name format, coded--></NAD0406>
					</NAD04>
					<NAD05>
						<NAD0501><!--3042: Street and number/p.o. box--></NAD0501>
						<NAD0502><!--3042: Street and number/p.o. box--></NAD0502>
						<NAD0503><!--3042: Street and number/p.o. box--></NAD0503>
						<NAD0504><!--3042: Street and number/p.o. box--></NAD0504>
					</NAD05>
					<NAD06><!--3164: CITY NAME--></NAD06>
					<NAD07><!--3229: Country sub-entity identification--></NAD07>
					<NAD08><!--3251: POSTCODE IDENTIFICATION--></NAD08>
					<NAD09><!--3207: Country, coded--></NAD09>
				</NAD>
				<LOC>
					<LOC01><!--3227: PLACE/LOCATION QUALIFIER--></LOC01>
					<LOC02>
						<LOC0201><!--3225: Place/location identification--></LOC0201>
						<LOC0202><!--1131: Code list qualifier--></LOC0202>
						<LOC0203><!--3055: Code list responsible agency, coded--></LOC0203>
						<LOC0204><!--3224: Place/location--></LOC0204>
					</LOC02>
					<LOC03>
						<LOC0301><!--3223: Related place/location one identification--></LOC0301>
						<LOC0302><!--1131: Code list qualifier--></LOC0302>
						<LOC0303><!--3055: Code list responsible agency, coded--></LOC0303>
						<LOC0304><!--3222: Related place/location one--></LOC0304>
					</LOC03>
					<LOC04>
						<LOC0401><!--3233: Related place/location two identification--></LOC0401>
						<LOC0402><!--1131: Code list qualifier--></LOC0402>
						<LOC0403><!--3055: Code list responsible agency, coded--></LOC0403>
						<LOC0404><!--3232: Related place/location two--></LOC0404>
					</LOC04>
					<LOC05><!--5479: RELATION, CODED--></LOC05>
				</LOC>
				<GROUP_36>
					<RFF>
						<RFF01>
							<RFF0101><!--1153: Reference qualifier--></RFF0101>
							<RFF0102><!--1154: Reference number--></RFF0102>
							<RFF0103><!--1156: Line number--></RFF0103>
							<RFF0104><!--4000: Reference version number--></RFF0104>
						</RFF01>
					</RFF>
					<DTM>
						<DTM01>
							<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
							<DTM0102><!--2380: Date/time/period--></DTM0102>
							<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
						</DTM01>
					</DTM>
				</GROUP_36>
				<GROUP_37>
					<DOC>
						<DOC01>
							<DOC0101><!--1001: DOCUMENT/MESSAGE NAME, CODED--></DOC0101>
							<DOC0102><!--1131: Code list qualifier--></DOC0102>
							<DOC0103><!--3055: Code list responsible agency, coded--></DOC0103>
							<DOC0104><!--1000: Document/message name--></DOC0104>
						</DOC01>
						<DOC02>
							<DOC0201><!--1004: Document/message number--></DOC0201>
							<DOC0202><!--1373: Document/message status, coded--></DOC0202>
							<DOC0203><!--1366: Document/message source--></DOC0203>
							<DOC0204><!--3453: Language, coded--></DOC0204>
						</DOC02>
						<DOC03><!--3153: COMMUNICATION CHANNEL IDENTIFIER, CODED--></DOC03>
						<DOC04><!--1220: NUMBER OF COPIES OF DOCUMENT REQUIRED--></DOC04>
						<DOC05><!--1218: NUMBER OF ORIGINALS OF DOCUMENT REQUIRED--></DOC05>
					</DOC>
					<DTM>
						<DTM01>
							<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
							<DTM0102><!--2380: Date/time/period--></DTM0102>
							<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
						</DTM01>
					</DTM>
				</GROUP_37>
				<GROUP_38>
					<CTA>
						<CTA01><!--3139: CONTACT FUNCTION, CODED--></CTA01>
						<CTA02>
							<CTA0201><!--3413: Department or employee identification--></CTA0201>
							<CTA0202><!--3412: Department or employee--></CTA0202>
						</CTA02>
					</CTA>
					<COM>
						<COM01>
							<COM0101><!--3148: Communication number--></COM0101>
							<COM0102><!--3155: Communication channel qualifier--></COM0102>
						</COM01>
					</COM>
				</GROUP_38>
			</GROUP_35>
			<GROUP_39>
				<ALC>
					<ALC01><!--5463: ALLOWANCE OR CHARGE QUALIFIER--></ALC01>
					<ALC02>
						<ALC0201><!--1230: Allowance or charge number--></ALC0201>
						<ALC0202><!--5189: Charge/allowance description, coded--></ALC0202>
					</ALC02>
					<ALC03><!--4471: SETTLEMENT, CODED--></ALC03>
					<ALC04><!--1227: CALCULATION SEQUENCE INDICATOR, CODED--></ALC04>
					<ALC05>
						<ALC0501><!--7161: Special services, coded--></ALC0501>
						<ALC0502><!--1131: Code list qualifier--></ALC0502>
						<ALC0503><!--3055: Code list responsible agency, coded--></ALC0503>
						<ALC0504><!--7160: Special service--></ALC0504>
						<ALC0505><!--7160: Special service--></ALC0505>
					</ALC05>
				</ALC>
				<ALI>
					<ALI01><!--3239: COUNTRY OF ORIGIN, CODED--></ALI01>
					<ALI02><!--9213: TYPE OF DUTY REGIME, CODED--></ALI02>
					<ALI03><!--4183: SPECIAL CONDITIONS, CODED--></ALI03>
					<ALI04><!--4183: SPECIAL CONDITIONS, CODED--></ALI04>
					<ALI05><!--4183: SPECIAL CONDITIONS, CODED--></ALI05>
					<ALI06><!--4183: SPECIAL CONDITIONS, CODED--></ALI06>
					<ALI07><!--4183: SPECIAL CONDITIONS, CODED--></ALI07>
				</ALI>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
				<GROUP_40>
					<QTY>
						<QTY01>
							<QTY0101><!--6063: Quantity qualifier--></QTY0101>
							<QTY0102><!--6060: Quantity--></QTY0102>
							<QTY0103><!--6411: Measure unit qualifier--></QTY0103>
						</QTY01>
					</QTY>
					<RNG>
						<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
						<RNG02>
							<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
							<RNG0202><!--6162: Range minimum--></RNG0202>
							<RNG0203><!--6152: Range maximum--></RNG0203>
						</RNG02>
					</RNG>
				</GROUP_40>
				<GROUP_41>
					<PCD>
						<PCD01>
							<PCD0101><!--5245: Percentage qualifier--></PCD0101>
							<PCD0102><!--5482: Percentage--></PCD0102>
							<PCD0103><!--5249: Percentage basis, coded--></PCD0103>
							<PCD0104><!--1131: Code list qualifier--></PCD0104>
							<PCD0105><!--3055: Code list responsible agency, coded--></PCD0105>
						</PCD01>
					</PCD>
					<RNG>
						<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
						<RNG02>
							<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
							<RNG0202><!--6162: Range minimum--></RNG0202>
							<RNG0203><!--6152: Range maximum--></RNG0203>
						</RNG02>
					</RNG>
				</GROUP_41>
				<GROUP_42>
					<MOA>
						<MOA01>
							<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
							<MOA0102><!--5004: Monetary amount--></MOA0102>
							<MOA0103><!--6345: Currency, coded--></MOA0103>
							<MOA0104><!--6343: Currency qualifier--></MOA0104>
							<MOA0105><!--4405: Status, coded--></MOA0105>
						</MOA01>
					</MOA>
					<RNG>
						<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
						<RNG02>
							<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
							<RNG0202><!--6162: Range minimum--></RNG0202>
							<RNG0203><!--6152: Range maximum--></RNG0203>
						</RNG02>
					</RNG>
				</GROUP_42>
				<GROUP_43>
					<RTE>
						<RTE01>
							<RTE0101><!--5419: Rate type qualifier--></RTE0101>
							<RTE0102><!--5420: Rate per unit--></RTE0102>
							<RTE0103><!--5284: Unit price basis--></RTE0103>
							<RTE0104><!--6411: Measure unit qualifier--></RTE0104>
						</RTE01>
					</RTE>
					<RNG>
						<RNG01><!--6167: RANGE TYPE QUALIFIER--></RNG01>
						<RNG02>
							<RNG0201><!--6411: Measure unit qualifier--></RNG0201>
							<RNG0202><!--6162: Range minimum--></RNG0202>
							<RNG0203><!--6152: Range maximum--></RNG0203>
						</RNG02>
					</RNG>
				</GROUP_43>
				<GROUP_44>
					<TAX>
						<TAX01><!--5283: DUTY/TAX/FEE FUNCTION QUALIFIER--></TAX01>
						<TAX02>
							<TAX0201><!--5153: Duty/tax/fee type, coded--></TAX0201>
							<TAX0202><!--1131: Code list qualifier--></TAX0202>
							<TAX0203><!--3055: Code list responsible agency, coded--></TAX0203>
							<TAX0204><!--5152: Duty/tax/fee type--></TAX0204>
						</TAX02>
						<TAX03>
							<TAX0301><!--5289: Duty/tax/fee account identification--></TAX0301>
							<TAX0302><!--1131: Code list qualifier--></TAX0302>
							<TAX0303><!--3055: Code list responsible agency, coded--></TAX0303>
						</TAX03>
						<TAX04><!--5286: DUTY/TAX/FEE ASSESSMENT BASIS--></TAX04>
						<TAX05>
							<TAX0501><!--5279: Duty/tax/fee rate identification--></TAX0501>
							<TAX0502><!--1131: Code list qualifier--></TAX0502>
							<TAX0503><!--3055: Code list responsible agency, coded--></TAX0503>
							<TAX0504><!--5278: Duty/tax/fee rate--></TAX0504>
							<TAX0505><!--5273: Duty/tax/fee rate basis identification--></TAX0505>
							<TAX0506><!--1131: Code list qualifier--></TAX0506>
							<TAX0507><!--3055: Code list responsible agency, coded--></TAX0507>
						</TAX05>
						<TAX06><!--5305: DUTY/TAX/FEE CATEGORY, CODED--></TAX06>
						<TAX07><!--3446: PARTY TAX IDENTIFICATION NUMBER--></TAX07>
					</TAX>
					<MOA>
						<MOA01>
							<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
							<MOA0102><!--5004: Monetary amount--></MOA0102>
							<MOA0103><!--6345: Currency, coded--></MOA0103>
							<MOA0104><!--6343: Currency qualifier--></MOA0104>
							<MOA0105><!--4405: Status, coded--></MOA0105>
						</MOA01>
					</MOA>
				</GROUP_44>
			</GROUP_39>
			<GROUP_45>
				<TDT>
					<TDT01><!--8051: TRANSPORT STAGE QUALIFIER--></TDT01>
					<TDT02><!--8028: CONVEYANCE REFERENCE NUMBER--></TDT02>
					<TDT03>
						<TDT0301><!--8067: Mode of transport, coded--></TDT0301>
						<TDT0302><!--8066: Mode of transport--></TDT0302>
					</TDT03>
					<TDT04>
						<TDT0401><!--8179: Type of means of transport identification--></TDT0401>
						<TDT0402><!--8178: Type of means of transport--></TDT0402>
					</TDT04>
					<TDT05>
						<TDT0501><!--3127: Carrier identification--></TDT0501>
						<TDT0502><!--1131: Code list qualifier--></TDT0502>
						<TDT0503><!--3055: Code list responsible agency, coded--></TDT0503>
						<TDT0504><!--3128: Carrier name--></TDT0504>
					</TDT05>
					<TDT06><!--8101: TRANSIT DIRECTION, CODED--></TDT06>
					<TDT07>
						<TDT0701><!--8457: Excess transportation reason, coded--></TDT0701>
						<TDT0702><!--8459: Excess transportation responsibility, coded--></TDT0702>
						<TDT0703><!--7130: Customer authorization number--></TDT0703>
					</TDT07>
					<TDT08>
						<TDT0801><!--8213: Id. of means of transport identification--></TDT0801>
						<TDT0802><!--1131: Code list qualifier--></TDT0802>
						<TDT0803><!--3055: Code list responsible agency, coded--></TDT0803>
						<TDT0804><!--8212: Id. of the means of transport--></TDT0804>
						<TDT0805><!--8453: Nationality of means of transport, coded--></TDT0805>
					</TDT08>
					<TDT09><!--8281: TRANSPORT OWNERSHIP, CODED--></TDT09>
				</TDT>
				<GROUP_46>
					<LOC>
						<LOC01><!--3227: PLACE/LOCATION QUALIFIER--></LOC01>
						<LOC02>
							<LOC0201><!--3225: Place/location identification--></LOC0201>
							<LOC0202><!--1131: Code list qualifier--></LOC0202>
							<LOC0203><!--3055: Code list responsible agency, coded--></LOC0203>
							<LOC0204><!--3224: Place/location--></LOC0204>
						</LOC02>
						<LOC03>
							<LOC0301><!--3223: Related place/location one identification--></LOC0301>
							<LOC0302><!--1131: Code list qualifier--></LOC0302>
							<LOC0303><!--3055: Code list responsible agency, coded--></LOC0303>
							<LOC0304><!--3222: Related place/location one--></LOC0304>
						</LOC03>
						<LOC04>
							<LOC0401><!--3233: Related place/location two identification--></LOC0401>
							<LOC0402><!--1131: Code list qualifier--></LOC0402>
							<LOC0403><!--3055: Code list responsible agency, coded--></LOC0403>
							<LOC0404><!--3232: Related place/location two--></LOC0404>
						</LOC04>
						<LOC05><!--5479: RELATION, CODED--></LOC05>
					</LOC>
					<DTM>
						<DTM01>
							<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
							<DTM0102><!--2380: Date/time/period--></DTM0102>
							<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
						</DTM01>
					</DTM>
				</GROUP_46>
			</GROUP_45>
			<GROUP_47>
				<TOD>
					<TOD01><!--4055: TERMS OF DELIVERY OR TRANSPORT FUNCTION, CODED--></TOD01>
					<TOD02><!--4215: Transport charges method of payment, coded--></TOD02>
					<TOD03>
						<TOD0301><!--4053: Terms of delivery or transport, coded--></TOD0301>
						<TOD0302><!--1131: Code list qualifier--></TOD0302>
						<TOD0303><!--3055: Code list responsible agency, coded--></TOD0303>
						<TOD0304><!--4052: Terms of delivery or transport--></TOD0304>
						<TOD0305><!--4052: Terms of delivery or transport--></TOD0305>
					</TOD03>
				</TOD>
				<LOC>
					<LOC01><!--3227: PLACE/LOCATION QUALIFIER--></LOC01>
					<LOC02>
						<LOC0201><!--3225: Place/location identification--></LOC0201>
						<LOC0202><!--1131: Code list qualifier--></LOC0202>
						<LOC0203><!--3055: Code list responsible agency, coded--></LOC0203>
						<LOC0204><!--3224: Place/location--></LOC0204>
					</LOC02>
					<LOC03>
						<LOC0301><!--3223: Related place/location one identification--></LOC0301>
						<LOC0302><!--1131: Code list qualifier--></LOC0302>
						<LOC0303><!--3055: Code list responsible agency, coded--></LOC0303>
						<LOC0304><!--3222: Related place/location one--></LOC0304>
					</LOC03>
					<LOC04>
						<LOC0401><!--3233: Related place/location two identification--></LOC0401>
						<LOC0402><!--1131: Code list qualifier--></LOC0402>
						<LOC0403><!--3055: Code list responsible agency, coded--></LOC0403>
						<LOC0404><!--3232: Related place/location two--></LOC0404>
					</LOC04>
					<LOC05><!--5479: RELATION, CODED--></LOC05>
				</LOC>
			</GROUP_47>
			<GROUP_48>
				<EQD>
					<EQD01><!--8053: EQUIPMENT QUALIFIER--></EQD01>
					<EQD02>
						<EQD0201><!--8260: Equipment identification number--></EQD0201>
						<EQD0202><!--1131: Code list qualifier--></EQD0202>
						<EQD0203><!--3055: Code list responsible agency, coded--></EQD0203>
						<EQD0204><!--3207: Country, coded--></EQD0204>
					</EQD02>
					<EQD03>
						<EQD0301><!--8155: Equipment size and type identification--></EQD0301>
						<EQD0302><!--1131: Code list qualifier--></EQD0302>
						<EQD0303><!--3055: Code list responsible agency, coded--></EQD0303>
						<EQD0304><!--8154: Equipment size and type--></EQD0304>
					</EQD03>
					<EQD04><!--8077: EQUIPMENT SUPPLIER, CODED--></EQD04>
					<EQD05><!--8249: EQUIPMENT STATUS, CODED--></EQD05>
					<EQD06><!--8169: FULL/EMPTY INDICATOR, CODED--></EQD06>
				</EQD>
				<HAN>
					<HAN01>
						<HAN0101><!--4079: Handling instructions, coded--></HAN0101>
						<HAN0102><!--1131: Code list qualifier--></HAN0102>
						<HAN0103><!--3055: Code list responsible agency, coded--></HAN0103>
						<HAN0104><!--4078: Handling instructions--></HAN0104>
					</HAN01>
					<HAN02>
						<HAN0201><!--7419: Hazardous material class code, identification--></HAN0201>
						<HAN0202><!--1131: Code list qualifier--></HAN0202>
						<HAN0203><!--3055: Code list responsible agency, coded--></HAN0203>
					</HAN02>
				</HAN>
				<MEA>
					<MEA01><!--6311: MEASUREMENT APPLICATION QUALIFIER--></MEA01>
					<MEA02>
						<MEA0201><!--6313: Measurement dimension, coded--></MEA0201>
						<MEA0202><!--6321: Measurement significance, coded--></MEA0202>
						<MEA0203><!--6155: Measurement attribute, coded--></MEA0203>
						<MEA0204><!--6154: Measurement attribute--></MEA0204>
					</MEA02>
					<MEA03>
						<MEA0301><!--6411: Measure unit qualifier--></MEA0301>
						<MEA0302><!--6314: Measurement value--></MEA0302>
						<MEA0303><!--6162: Range minimum--></MEA0303>
						<MEA0304><!--6152: Range maximum--></MEA0304>
						<MEA0305><!--6432: Significant digits--></MEA0305>
					</MEA03>
					<MEA04><!--7383: SURFACE/LAYER INDICATOR, CODED--></MEA04>
				</MEA>
				<FTX>
					<FTX01><!--4451: TEXT SUBJECT QUALIFIER--></FTX01>
					<FTX02><!--4453: TEXT FUNCTION, CODED--></FTX02>
					<FTX03>
						<FTX0301><!--4441: Free text, coded--></FTX0301>
						<FTX0302><!--1131: Code list qualifier--></FTX0302>
						<FTX0303><!--3055: Code list responsible agency, coded--></FTX0303>
					</FTX03>
					<FTX04>
						<FTX0401><!--4440: Free text--></FTX0401>
						<FTX0402><!--4440: Free text--></FTX0402>
						<FTX0403><!--4440: Free text--></FTX0403>
						<FTX0404><!--4440: Free text--></FTX0404>
						<FTX0405><!--4440: Free text--></FTX0405>
					</FTX04>
					<FTX05><!--3453: Language, coded--></FTX05>
				</FTX>
			</GROUP_48>
			<GROUP_49>
				<SCC>
					<SCC01><!--4017: DELIVERY PLAN STATUS INDICATOR, CODED--></SCC01>
					<SCC02><!--4493: DELIVERY REQUIREMENTS, CODED--></SCC02>
					<SCC03>
						<SCC0301><!--2013: Frequency, coded--></SCC0301>
						<SCC0302><!--2015: Despatch pattern, coded--></SCC0302>
						<SCC0303><!--2017: Despatch pattern timing, coded--></SCC0303>
					</SCC03>
				</SCC>
				<FTX>
					<FTX01><!--4451: TEXT SUBJECT QUALIFIER--></FTX01>
					<FTX02><!--4453: TEXT FUNCTION, CODED--></FTX02>
					<FTX03>
						<FTX0301><!--4441: Free text, coded--></FTX0301>
						<FTX0302><!--1131: Code list qualifier--></FTX0302>
						<FTX0303><!--3055: Code list responsible agency, coded--></FTX0303>
					</FTX03>
					<FTX04>
						<FTX0401><!--4440: Free text--></FTX0401>
						<FTX0402><!--4440: Free text--></FTX0402>
						<FTX0403><!--4440: Free text--></FTX0403>
						<FTX0404><!--4440: Free text--></FTX0404>
						<FTX0405><!--4440: Free text--></FTX0405>
					</FTX04>
					<FTX05><!--3453: Language, coded--></FTX05>
				</FTX>
				<RFF>
					<RFF01>
						<RFF0101><!--1153: Reference qualifier--></RFF0101>
						<RFF0102><!--1154: Reference number--></RFF0102>
						<RFF0103><!--1156: Line number--></RFF0103>
						<RFF0104><!--4000: Reference version number--></RFF0104>
					</RFF01>
				</RFF>
				<GROUP_50>
					<QTY>
						<QTY01>
							<QTY0101><!--6063: Quantity qualifier--></QTY0101>
							<QTY0102><!--6060: Quantity--></QTY0102>
							<QTY0103><!--6411: Measure unit qualifier--></QTY0103>
						</QTY01>
					</QTY>
					<DTM>
						<DTM01>
							<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
							<DTM0102><!--2380: Date/time/period--></DTM0102>
							<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
						</DTM01>
					</DTM>
				</GROUP_50>
			</GROUP_49>
			<GROUP_51>
				<RCS>
					<RCS01><!--7293: SECTOR/SUBJECT IDENTIFICATION QUALIFIER--></RCS01>
					<RCS02>
						<RCS0201><!--7295: Requirement/condition identification--></RCS0201>
						<RCS0202><!--1131: Code list qualifier--></RCS0202>
						<RCS0203><!--3055: Code list responsible agency, coded--></RCS0203>
						<RCS0204><!--7294: Requirement or condition--></RCS0204>
					</RCS02>
					<RCS03><!--1229: Action request/notification, coded--></RCS03>
				</RCS>
				<RFF>
					<RFF01>
						<RFF0101><!--1153: Reference qualifier--></RFF0101>
						<RFF0102><!--1154: Reference number--></RFF0102>
						<RFF0103><!--1156: Line number--></RFF0103>
						<RFF0104><!--4000: Reference version number--></RFF0104>
					</RFF01>
				</RFF>
				<DTM>
					<DTM01>
						<DTM0101><!--2005: Date/time/period qualifier--></DTM0101>
						<DTM0102><!--2380: Date/time/period--></DTM0102>
						<DTM0103><!--2379: Date/time/period format qualifier--></DTM0103>
					</DTM01>
				</DTM>
				<FTX>
					<FTX01><!--4451: TEXT SUBJECT QUALIFIER--></FTX01>
					<FTX02><!--4453: TEXT FUNCTION, CODED--></FTX02>
					<FTX03>
						<FTX0301><!--4441: Free text, coded--></FTX0301>
						<FTX0302><!--1131: Code list qualifier--></FTX0302>
						<FTX0303><!--3055: Code list responsible agency, coded--></FTX0303>
					</FTX03>
					<FTX04>
						<FTX0401><!--4440: Free text--></FTX0401>
						<FTX0402><!--4440: Free text--></FTX0402>
						<FTX0403><!--4440: Free text--></FTX0403>
						<FTX0404><!--4440: Free text--></FTX0404>
						<FTX0405><!--4440: Free text--></FTX0405>
					</FTX04>
					<FTX05><!--3453: Language, coded--></FTX05>
				</FTX>
			</GROUP_51>
			<GROUP_52>
				<STG>
					<STG01><!--9421: STAGES QUALIFIER--></STG01>
					<STG02><!--6426: NUMBER OF STAGES--></STG02>
					<STG03><!--6428: ACTUAL STAGE COUNT--></STG03>
				</STG>
				<GROUP_53>
					<QTY>
						<QTY01>
							<QTY0101><!--6063: Quantity qualifier--></QTY0101>
							<QTY0102><!--6060: Quantity--></QTY0102>
							<QTY0103><!--6411: Measure unit qualifier--></QTY0103>
						</QTY01>
					</QTY>
					<MOA>
						<MOA01>
							<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
							<MOA0102><!--5004: Monetary amount--></MOA0102>
							<MOA0103><!--6345: Currency, coded--></MOA0103>
							<MOA0104><!--6343: Currency qualifier--></MOA0104>
							<MOA0105><!--4405: Status, coded--></MOA0105>
						</MOA01>
					</MOA>
				</GROUP_53>
			</GROUP_52>
		</GROUP_25>
		<UNS>
			<UNS01><!--0081: Section identification--></UNS01>
		</UNS>
		<MOA>
			<MOA01>
				<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
				<MOA0102><!--5004: Monetary amount--></MOA0102>
				<MOA0103><!--6345: Currency, coded--></MOA0103>
				<MOA0104><!--6343: Currency qualifier--></MOA0104>
				<MOA0105><!--4405: Status, coded--></MOA0105>
			</MOA01>
		</MOA>
		<CNT>
			<CNT01>
				<CNT0101><!--6069: Control qualifier--></CNT0101>
				<CNT0102><!--6066: Control value--></CNT0102>
				<CNT0103><!--6411: Measure unit qualifier--></CNT0103>
			</CNT01>
		</CNT>
		<GROUP_54>
			<ALC>
				<ALC01><!--5463: ALLOWANCE OR CHARGE QUALIFIER--></ALC01>
				<ALC02>
					<ALC0201><!--1230: Allowance or charge number--></ALC0201>
					<ALC0202><!--5189: Charge/allowance description, coded--></ALC0202>
				</ALC02>
				<ALC03><!--4471: SETTLEMENT, CODED--></ALC03>
				<ALC04><!--1227: CALCULATION SEQUENCE INDICATOR, CODED--></ALC04>
				<ALC05>
					<ALC0501><!--7161: Special services, coded--></ALC0501>
					<ALC0502><!--1131: Code list qualifier--></ALC0502>
					<ALC0503><!--3055: Code list responsible agency, coded--></ALC0503>
					<ALC0504><!--7160: Special service--></ALC0504>
					<ALC0505><!--7160: Special service--></ALC0505>
				</ALC05>
			</ALC>
			<ALI>
				<ALI01><!--3239: COUNTRY OF ORIGIN, CODED--></ALI01>
				<ALI02><!--9213: TYPE OF DUTY REGIME, CODED--></ALI02>
				<ALI03><!--4183: SPECIAL CONDITIONS, CODED--></ALI03>
				<ALI04><!--4183: SPECIAL CONDITIONS, CODED--></ALI04>
				<ALI05><!--4183: SPECIAL CONDITIONS, CODED--></ALI05>
				<ALI06><!--4183: SPECIAL CONDITIONS, CODED--></ALI06>
				<ALI07><!--4183: SPECIAL CONDITIONS, CODED--></ALI07>
			</ALI>
			<MOA>
				<MOA01>
					<MOA0101><!--5025: Monetary amount type qualifier--></MOA0101>
					<MOA0102><!--5004: Monetary amount--></MOA0102>
					<MOA0103><!--6345: Currency, coded--></MOA0103>
					<MOA0104><!--6343: Currency qualifier--></MOA0104>
					<MOA0105><!--4405: Status, coded--></MOA0105>
				</MOA01>
			</MOA>
		</GROUP_54>
		<UNT>
			<UNT01><!--0074: Number of segments in the message-->162</UNT01>
			<UNT02><!--0062: Message reference number-->MESSAGENUMBER</UNT02>
		</UNT>
	</ORDERS>
	<UNZ>
		<UNZ01><!--0036: Interchange control count-->1</UNZ01>
		<UNZ02><!--0020: Interchange control reference-->ICONTROL</UNZ02>
	</UNZ>
</EDIFACT>