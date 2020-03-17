-- Par : Abdelkhalek BENHOUMINE
-- Creation de la table personne (sans constrainte)
CREATE TABLE personne (
    id number , 
    nom varchar2(40),
    prenom varchar2(40)
)  ; 
-- ajout des données
INSERT INTO personne VALUES(1 , 'abdelkhalek','benhoumine'); 
INSERT INTO personne VALUES(2 , 'abdelkhalek','benhoumine'); 
INSERT INTO personne VALUES(3 , 'abdelkhalek','benhoumine'); 
INSERT INTO personne VALUES(4 , 'abdelkhalek','benhoumine'); 
INSERT INTO personne VALUES(5 , 'abdelkhalek','benhoumine'); 
INSERT INTO personne VALUES(6 , 'abdelkhalek','benhoumine'); 
-- Cursor
DECLARE
    CURSOR Info_personne IS
    SELECT id , nom , prenom
    FROM personne ; 
    v_info_personne Info_personne%ROWTYPE ; 
BEGIN
    IF(not(Info_personne%ISOPEN)) then 
        OPEN Info_personne ;
    END IF ; 

    LOOP
        FETCH Info_personne into v_info_personne ;
            
        dbms_output.put_line('le numero de la ligne = '|| Info_personne%ROWCOUNT) ; 
        EXIT WHEN Info_personne%NOTFOUND ; 
            if(v_info_personne.id = 1) then 
                dbms_output.put_line('KING'); 
            else 
            dbms_output.put_line('id = '||v_info_personne.id ||' nom '||v_info_personne.nom|| ' p = '|| v_info_personne.prenom); 
            end if ; 
    END LOOP;
    CLOSE Info_personne ; 
END ; 