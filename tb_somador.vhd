library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_somador is
end tb_somador;

architecture teste of tb_somador is

  -- Declaração do componente a ser simulado:
  component Somador is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
		a	: in std_logic_vector  ((DATA_WIDTH-1) downto 0);
		b	: in std_logic_vector  ((DATA_WIDTH-1) downto 0);
		result 	: out std_logic_vector ((DATA_WIDTH-1) downto 0)
	);

  end component;

  -- Declaração dos "fios" internos necessários para injetar no componente os estímulos de simulação:
  signal fio_a, fio_b, fio_soma: std_logic_vector(3 downto 0);

begin

 -- Instancie o componente "Somador" declarado acima para simulação, conectando-o aos "fios" com os estímulos:
 instancia_somador: somador generic map (DATA_WIDTH => 4) port map (a=>fio_a,b=>fio_b,result=>fio_soma);

 -- As próximas linhas criam os estímulos da simulação,
 -- A letra 'x' indica que os valores a seguir estão expressos em base hexadecimal
 fio_a <= x"0", x"A" after 20 ns, x"2" after 40 ns, x"4" after 60 ns;
 fio_b <= x"0", x"4" after 10 ns, x"3" after 30 ns, x"1" after 50 ns;

end teste;