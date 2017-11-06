program Exo_2;
  var
    h_1, m_1, s_1: integer;
    h_2, m_2, s_2: integer;
    h_3, m_3, s_3: integer;
    procedure sommeH;
    begin
      s_3 := (s_1 + s_2) mod 60;
      m_2 := m_2 + ((s_1 + s_2) div 60);
      m_3 := (m_1 + m_2) mod 60;
      h_2 := h_2 + ((m_1 + m_2) div 60);
      h_3 := (h_1 + h_2) mod 24;
    end;
begin
  readln(h_1,m_1,s_1,h_2,m_2,s_2);
  if (s_1 > 0) and (s_2 > 0) then
  begin
    sommeH;
    writeln('seconde:');
    writeln(s_3);
    writeln('minute:');
    writeln(m_3)
    writeln('heure:');
    writeln(h_3)
  end
  else
    writeln('mauvais entree')
end.
