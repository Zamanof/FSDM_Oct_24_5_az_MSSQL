﻿-- Normalization

/*
Normallaşdırılmamış DB-lərin əlamətləri:
	+ Cədvəl birdən artıq entity haqqında məlumat saxlayır
	+ Cədvəldə və ya DB-də təkrarlanan sütunlar var
	+ Sütunlar təkrarlanan informasiyaları saxlayır

	
	Normallaşdırılmış formada hər cədvəl yalnız bir mahiyyət haqda məlumatı saxlayır və bir mənanı bazada yalnız bir dəfə görmək olur.

	MB-nin qeyri-optimallığının aradan qaldırılma proseduru üçün normallaşdırma mövcuddur. 

	Normallaşdırma – bu, məlumatların məlumatların artıqlığı aradan qaldırmaq üçün və məlumatların dəyişilməsi zamanı onların bütövlüyünün dağılmasından qaçmaq üçün, yəni dəyişimin anomaliyasından qaçmaq üçün ayrı birləşmiş cədvəllər üzrə bölünmə prosesidir. 
	
	Normallaşdırmanı həyata keçirmək üçün bir neçə normal forma təsfiro lunmuşdur. 

	Hər normal forma (birinci xaric) nəzərdə tutur ki, məlumatlara qarşı keçmiş normal forma artıq tətbiq edilmişdir.
	Məsələn, üçüncü normal formau məlumatlara qarçı tətbiq etməmişdən öncə, 
	Ikinci normal forma tətbiq olunmalıdır. İkinci normal formadan öncə isə birinci normal formau həyata keçirmək lazımdır.
	

*/

/*
1NF - Birinci Normal Forma
	1NF ehtiva edir ki, cədvəllərdə təkrarlanan sütun və
	sətirlər olmamalıdır və sütun və sətirlərimizn 
	kəsişməsində olan informasiya atomar(bölünməz) olmalıdır.
	
	Atomar olmayan informasiya:
	---------------------------------------------------------
	|		Fullname				|			Age			|
	---------------------------------------------------------
	|   Zamanov Nadir Rasim			|			44			|
	---------------------------------------------------------

	Atomar olan informasiya:
	---------------------------------------------------------
	|  Lastname | Firstname |  	Patronymic	|	Age			|
	---------------------------------------------------------
	|   Zamanov |   Nadir   |   Rasim		|	  44		|
	---------------------------------------------------------


2NF - İkinci Normal Forma
	2NF ehtiva edir ki, 1NF artıq tətbiq olunubdur.
	Və açar olmayan sütunlar İlkin Açardan (Primary Key)
	asılı omalıdır.
	Bu da o deməkdir ki, bir cədvəl yalnız və yalnız
	bir entity-ni təsvir etməlidir.
	!!! NƏ 2, NƏ 1.5 ENTITY DEYİL. YALNIZ VƏ YALNIZ BIR ENTITY!!!


3NF - Üçüncü Normal Forma
	3NF ehtiva edir ki, 1NF və 2NF artıq tətbiq olunubdur.
	Və açar olmayan sütunlar yalnız və yalnız 
	İlkin Açardan (Primary Key) asılı omalıdır.


*/

/*
Normallaşdırma: hə və ya yox. 
 
	Normallaşdırmanın verdiyi açıq-aşkar olan üstünlüklərə baxmayaraq, hər şey üçün ödəniş etmək lazımdır. Normallaşdırmadan istifadə etmənin həmçinin öz qiyməti var.
 
	Bir tərəfdən göstərilmiş MB 1NF, 2NF və 3NF-ə  artıq olan və məntiqi ziddiyətdən qurtulmağa imkan yaradır.
Gigər tərəfdən isə, o, MB-də cədvəllərin xeyli sayda çoxalmasına gətirib çıxarır. 
	Bir halda ki, əgər söhbət böyük MB-dən gedirsə, o zaman bu emalı çox mürəkkəbləşdirə bilər. 
	Normallaşdırma zamanı ortaya çıxan digər problem – məhsuldarlıq problemidir. İlk növbədə bu 3NF-ə aiddir. 
	3NF-in tələblərinə sərt şəkildə riaət etmək belə adlanan toplayan sahələrdən qurtulmağa gətirib çıxarır.
Bu o deməkdir ki, bəzi məlumatları oxumaq lazım gələrsə, o zaman 	MB serveri orta toplaan mənalardan istifadə etmək əvəzinə hər dəfə hesablamanı təzədən etməli olacaq. 

	Belə hallarda normal formalar tərəfindən qoyulan tələblərə sərt riayət etməmək mənalı ola bilər. 
	Öncə bu 3NF-ə aiddir. İlk iki NF-də MB-ni göstərmək məsləhət görülür.	3NF-ə qalanda isə, burada proqramçının konkret məsələni və bu məsələdə olan əməliyyatları nəzərdə tutaraq qərar qəbul etməsi məsləhət görülür. 
*/