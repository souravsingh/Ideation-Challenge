#!/usr/bin/perl
use List::MoreUtils qw(uniq);

open (fw,">dipep.txt");

open (fx,">dipep_out.csv");			###FINAL OUTPUT FILE

$count=1;

			## ARRAY FOR PRINTING IN LIBSVM FORMAT#####

@comb=("AA:1", "AC:2", "AD:3", "AE:4", "AF:5", "AG:6", "AH:7", "AI:8", "AK:9", "AL:10", "AM:11", "AN:12", "AP:13", "AQ:14", "AR:15", "AS:16", "AT:17", "AV:18", "AW:19", "AY:20", "CA:21", "CC:22", "CD:23", "CE:24", "CF:25", "CG:26", "CH:27", "CI:28", "CK:29", "CL:30", "CM:31", "CN:32", "CP:33", "CQ:34", "CR:35", "CS:36", "CT:37", "CV:38", "CW:39", "CY:40", "DA:41", "DC:42", "DD:43", "DE:44", "DF:45", "DG:46", "DH:47", "DI:48", "DK:49", "DL:50", "DM:51", "DN:52", "DP:53", "DQ:54", "DR:55", "DS:56", "DT:57", "DV:58", "DW:59", "DY:60", "EA:61", "EC:62", "ED:63", "EE:64", "EF:65", "EG:66", "EH:67", "EI:68", "EK:69", "EL:70", "EM:71", "EN:72", "EP:73", "EQ:74", "ER:75", "ES:76", "ET:77", "EV:78", "EW:79", "EY:80", "FA:81", "FC:82", "FD:83", "FE:84", "FF:85", "FG:86", "FH:87", "FI:88", "FK:89", "FL:90", "FM:91", "FN:92", "FP:93", "FQ:94", "FR:95", "FS:96", "FT:97", "FV:98", "FW:99", "FY:100", "GA:101", "GC:102", "GD:103", "GE:104", "GF:105", "GG:106", "GH:107", "GI:108", "GK:109", "GL:110", "GM:111", "GN:112", "GP:113", "GQ:114", "GR:115", "GS:116", "GT:117", "GV:118", "GW:119", "GY:120", "HA:121", "HC:122", "HD:123", "HE:124", "HF:125", "HG:126", "HH:127", "HI:128", "HK:129", "HL:130", "HM:131", "HN:132", "HP:133", "HQ:134", "HR:135", "HS:136", "HT:137", "HV:138", "HW:139", "HY:140", "IA:141", "IC:142", "ID:143", "IE:144", "IF:145", "IG:146", "IH:147", "II:148", "IK:149", "IL:150", "IM:151", "IN:152", "IP:153", "IQ:154", "IR:155", "IS:156", "IT:157", "IV:158", "IW:159", "IY:160", "KA:161", "KC:162", "KD:163", "KE:164", "KF:165", "KG:166", "KH:167", "KI:168", "KK:169", "KL:170", "KM:171", "KN:172", "KP:173", "KQ:174", "KR:175", "KS:176", "KT:177", "KV:178", "KW:179", "KY:180", "LA:181", "LC:182", "LD:183", "LE:184", "LF:185", "LG:186", "LH:187", "LI:188", "LK:189", "LL:190", "LM:191", "LN:192", "LP:193", "LQ:194", "LR:195", "LS:196", "LT:197", "LV:198", "LW:199", "LY:200", "MA:201", "MC:202", "MD:203", "ME:204", "MF:205", "MG:206", "MH:207", "MI:208", "MK:209", "ML:210", "MM:211", "MN:212", "MP:213", "MQ:214", "MR:215", "MS:216", "MT:217", "MV:218", "MW:219", "MY:220", "NA:221", "NC:222", "ND:223", "NE:224", "NF:225", "NG:226", "NH:227", "NI:228", "NK:229", "NL:230", "NM:231", "NN:232", "NP:233", "NQ:234", "NR:235", "NS:236", "NT:237", "NV:238", "NW:239", "NY:240", "PA:241", "PC:242", "PD:243", "PE:244", "PF:245", "PG:246", "PH:247", "PI:248", "PK:249", "PL:250", "PM:251", "PN:252", "PP:253", "PQ:254", "PR:255", "PS:256", "PT:257", "PV:258", "PW:259", "PY:260", "QA:261", "QC:262", "QD:263", "QE:264", "QF:265", "QG:266", "QH:267", "QI:268", "QK:269", "QL:270", "QM:271", "QN:272", "QP:273", "QQ:274", "QR:275", "QS:276", "QT:277", "QV:278", "QW:279", "QY:280", "RA:281", "RC:282", "RD:283", "RE:284", "RF:285", "RG:286", "RH:287", "RI:288", "RK:289", "RL:290", "RM:291", "RN:292", "RP:293", "RQ:294", "RR:295", "RS:296", "RT:297", "RV:298", "RW:299", "RY:300", "SA:301", "SC:302", "SD:303", "SE:304", "SF:305", "SG:306", "SH:307", "SI:308", "SK:309", "SL:310", "SM:311", "SN:312", "SP:313", "SQ:314", "SR:315", "SS:316", "ST:317", "SV:318", "SW:319", "SY:320", "TA:321", "TC:322", "TD:323", "TE:324", "TF:325", "TG:326", "TH:327", "TI:328", "TK:329", "TL:330", "TM:331", "TN:332", "TP:333", "TQ:334", "TR:335", "TS:336", "TT:337", "TV:338", "TW:339", "TY:340", "VA:341", "VC:342", "VD:343", "VE:344", "VF:345", "VG:346", "VH:347", "VI:348", "VK:349", "VL:350", "VM:351", "VN:352", "VP:353", "VQ:354", "VR:355", "VS:356", "VT:357", "VV:358", "VW:359", "VY:360", "WA:361", "WC:362", "WD:363", "WE:364", "WF:365", "WG:366", "WH:367", "WI:368", "WK:369", "WL:370", "WM:371", "WN:372", "WP:373", "WQ:374", "WR:375", "WS:376", "WT:377", "WV:378", "WW:379", "WY:380", "YA:381", "YC:382", "YD:383", "YE:384", "YF:385", "YG:386", "YH:387", "YI:388", "YK:389", "YL:390", "YM:391", "YN:392", "YP:393", "YQ:394", "YR:395", "YS:396", "YT:397", "YV:398", "YW:399", "YY:400");
#foreach $z (@comb) {
#print $z,"\n";
#}

open (fr,"input.txt");			###INPUT FILE ###
@seqdata=<fr>;

foreach $seq (@seqdata) {
	chomp $seq;
	print $seq,"\n";


@data=split('',$seq);

#### CALCULATION OF DIPEP FREQ ######

for (my $i = 0; $i < @data; $i++) {
  $dp= "$data[$i]$data[$i+1]","\n";
  if ($dp=~/\w{2}/) {
	  # print $dp,"\n";
	   push (@dpcomb,$dp)
  }
   
}
@uncdpcmb = uniq @dpcomb;

$seqlength=@dpcomb;
#print $seqlength,"\n";

foreach $aa (@uncdpcmb) 
{
	$caa=0;
	foreach $line (@dpcomb) 
		{
			if ("$aa" eq "$line") 
			{			
			$caa++;
			$rf= ($caa/400)*100;
			}		
		}
		#print $aa,"\t";	
		#print $caa,"\t";
		#print $rf,"\n";
		$dpfq="$aa:"."$rf";
		#print $dpfq,"\n";
		push (@hhh,$dpfq)
}

foreach $z (@comb) {
	chomp $z;
	#print "$z\n";
	$z=~/(\w{2})\:(.+)/;
	$za=$1;
	$zfq=$2;
	#print "$za\t$zfq\n";
	#print fw " $zfq:";			## PRINTING IN LIBSVM FORMAT#####
	foreach $a (@hhh) {
		#print $a,"\n";
		$a=~/(\w{2})\:(.+)/;
		$aas=$1;
		$aafq=$2;
		#print "$za\t$aas\t$aafq\n";
		if ("$za" eq "$aas") {
			print fw "$aafq,";
		}
		
		
		
	}


}


print fw "\n";
undef (@data);
undef (@dpcomb);
undef (@uncdpcmb);
undef (@hhh);
}
close (fw);


			##PRINT 0 FOR NON-RELEVANT FEATURES ##

open (fs,"dipep.txt");
while (<fs>) {
	#print $_;
	$ln=$_;
	@spl=split(" ",$ln);
	#print fx "$spl[5]";
	foreach $abc (@spl) {
		#print $abc;
		if ($abc=~/\d+:\d+/) {
			print fx "$abc ";
		}
		if ($abc!~/\d+:\d+/) {
			#$num=$1;
			$temp="$abc"."0";
			print fx "$temp ";
			#$abc=~s/$abc/$abc/;
			#print fx $abc;
		}
	}
	print fx "\n";
}



