program Etudiant;
  const
    TailleNomFamille = 67;
    TaillePrenom = 15;
    TailleSection = 55;
  Type
    EtudiantType = record {stock les infomation sur les étudiant}
      NomFamille : string[TailleNomFamille];
      Prenom: string[TaillePrenom];
      NumerosEtudiant : integer;
      Section : string[TailleSection];
      NoteCc : array[0..2] of Real;
    end;
    var
      ListeEtudiant : array[0..10] of EtudiantType;
      NbEtudiant : integer;
      NbSixCcUn, NbSixCcDeux, NbSixCcTrois : integer;
      NbEchecCcUn, NbEchecCcDeux, NbEchecCcTrois: integer;
      NbMoyen: integer;
      i : integer;
    procedure InfoEtudiant(var Etudiant: EtudiantType);
    var
      i : integer;
    begin
      with Etudiant do
        begin
          writeln('Nom de Famille : ');
          readln(NomFamille);
          writeln('Prenom :');
          readln(Prenom);
          writeln('Numeros Etudiant : ');
          readln(NumerosEtudiant);
          writeln('Section : ');
          readln(Section);
          for i := 0 to 2 do
            begin
              writeln('Entre note CC');
              readln(NoteCc[i]);
            end; {for}
              writeln('Fin de l Enregistrement')
        end; {with}
    end; {Fin proc}
    begin
      writeln('Bienvenu dans l outil de calcul des Controle Continue');
      writeln('Conbien voulez vous rentrer d Etudiant');
      readln(NbEtudiant);
      for i := 0 to (NbEtudiant - 1) do begin
        InfoEtudiant(ListeEtudiant[i]);
      end;
      writeln('En Moyenne');
      for i := 0 to (NbEtudiant - 1) do begin
        with ListeEtudiant[i] do
          if (NoteCc[0] = 6) then
            NbSixCcUn := NbSixCcUn + 1;
          if (NoteCc[1] = 6) then
            NbSixCcDeux := NbSixCcDeux + 1;
          if NoteCc[2] == 6 then
            NbSixCcTrois := NbSixCcTrois + 1;
          writeln('la moyenne de' + Prenom + Etudiant + 'est de ' + ((NoteCc[1]+NoteCc[0]+NoteCc[2])/3));

        end; {with}
      end; {for}
    end.
