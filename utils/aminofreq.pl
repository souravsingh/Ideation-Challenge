#!/usr/bin/perl
use List::MoreUtils qw(uniq);

open (fr,"input.txt");		#INPUT FILE

open (fw,">AAFRQ.txt");

open (fx,">feat_out.csv");		#FINAL OUTPUT FILE

		## ARRAY FOR PRINTING IN LIBSVM FORMAT#####

@comb=("A:1","C:2","D:3","E:4","F:5","G:6","H:7","I:8","K:9","L:10","M:11","N:12","P:13","Q:14","R:15","S:16","T:17","V:18","W:19","Y:20");

@seqdata=<fr>;

	foreach $seq (@seqdata) {
		chomp $seq;
		#print $seq,"\n";
	$count=0;
	$seqlength = length ($seq); 	#PEPTIDE LENGTH
	
	@aa=split('',$seq);
	@unique_words = uniq @aa;
	@raj=sort@unique_words;

print "Residue\tcount\tFrequency\n";

foreach $aa (@raj) 
{
	$caa=0;
	foreach $line (@aa) 
		{
			if ($aa=~/$line/) 
			{			
			$caa++;
			$rf= ($caa/$seqlength)*100;		#Calculation of AAFreq
			}		
		}
		print $aa,"\t";	
		print $caa,"\t";
		print $rf,"\n";
		$aafq="$aa:"."$rf";
		#print $aafq,"\n";
		
		push (@hhh,$aafq)
}

			

foreach $z (@comb) {
	chomp $z;
	#print "$z\n";
	$z=~/(\w{1})\:(.+)/;
	$za=$1;
	$zfq=$2;
	#print "$za\t$zfq\n";
	#print fw " $zfq:";			##PRINT IN LIBSVM FORMAT
	
	foreach $a (@hhh) {
		#print $a,"\n";
		$a=~/(\w{1})\:(.+)/;
		$aas=$1;
		$aafq=$2;
		#print "$za\t$aas\t$aafq\n";
		
		if ("$za" eq "$aas") {		##OUTPUT
			print fw "$aafq,";
		}	
		
		
	}


}

print fw "\n";
undef (@aa);					##Empty all the ARRAYS used##
undef (@unique_words);
undef (@raj);
undef (@hhh);
}



close (fw);


##PRINT 0 FOR NON-RELEVANT FEATURES

open (fs,"AAFRQ.txt");
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
			print fx "$temp ";			##FINAL OUTPUT PRINT
			#$abc=~s/$abc/$abc/;
			#print fx $abc;
		}
	}
	print fx "\n";
}
