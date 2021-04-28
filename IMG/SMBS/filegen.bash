#! /usr/bin/env bash

mkdir /srv/depts

mkdir /srv/depts/arts-and-music /srv/depts/language-arts /srv/depts/math /srv/depts/science/ /srv/depts/social-studies

ssnames=("EUR201-EuropeanHistoryTest01" "USH101-FoundingPhilosophis" "CIV122-IndustrializationFactSheet" "CIV104-MesopotamiaAndTheUbaidPeriod" "CIV111-PreColonialAfrica")

artnames=("MH101-IntroductionToMusicTheory" "ART102-12thCenturyArtRenaissanceInContext" "MT110-ReadingSheetMusicApplied")

litnames=("LIT101-ClassicAmericanLiterature" "WRI142-PersuasiveWritingSyllabus" "LIT110-ThemesOfShakespeareWriting" "WRI201-PoeticDiscourse")

sciencenames=("BIO195-IsTheMitochondreaThePowerhouse" "GEO210-IntroToGlaciology" "CHM245-OrganicChemistryFormulaCheatSheet")

for filename in ${artnames[@]}; do
	wget "http://loripsum.net/api/10/medium/bq/plaintext" -O "/srv/depts/arts-and-music/$filename.txt"
done

for filename in ${litnames[@]}; do
	wget "http://loripsum.net/api/20/large/bq/plaintext" -O "/srv/depts/language-arts/$filename.txt"
done

for filename in ${sciencenames[@]}; do
	wget "http://loripsum.net/api/18/small/plaintext" -O "/srv/depts/science/$filename.txt"
done

for filename in ${ssnames[@]}; do
	wget "http://loripsum.net/api/18/small/plaintext" -O "/srv/depts/social-studies/$filename.txt"
done

wget "http://loripsum.net/api/100/medium/plaintext" -O "/srv/misc/ToS.txt"

wget "http://loripsum.net/api/87/headers/plaintext" -O "/srv/misc/FacultyGuidelines.txt"

