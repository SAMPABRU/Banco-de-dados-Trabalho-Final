CREATE DATABASE PROJE2016

USE PROJE2016


/*

Nome e RA dos integrantes do grupo:

Bruno Sampaio          RA: 140004
Christian Sanches dos Santos          RA: 140203
Everson Nascimento          RA: 152940 

*/

/*Cria a tabela escola*/
Create table escola
(
Nome varchar(100) not null,
Cidade varchar(50) not null,
Estado varchar(2) not null,
CEP varchar(10) not null,
Bairro varchar(100) not null,
Email varchar(100) not null,
Telefone numeric(18,0) not null,
CNPJ varchar(50) not null,
Endereco varchar(150) not null,
DataCadastro datetime not null
)


/*Cria a tabela Curso(Idiomas)*/
Create table cursoidioma
(
Curso varchar(100) not null,
Duracao int not null,
VagasDisponiveis int not null,
ValorMensalidade numeric(18,2) not null,
)


/*Cria a tabela Turma*/
Create table turma
(
Periodo varchar(50) not null,
Nivel varchar(50) not null,
DataInicio datetime not null,
DataTermino datetime not null,
)


/*Cria a tabela Aluno*/
Create table aluno
(
NomeAluno varchar(100) not null,
Cidade varchar(50) not null,
Endereco varchar(100) not null,
Bairro varchar(50) not null,
Estado varchar(2) not null,
CEP varchar(10) not null,
CPF varchar(20) not null,
Email varchar(100) not null,
Telefone varchar(30) not null,
DataNascimento datetime not null,
DataCadastro datetime not null,
PossuiDesconto varchar(2) not null
)


/*Cria a tabela Matr�cula*/
Create table matricula
(
Nota numeric(18,2) not null,
DataMatricula datetime not null
)


/*Cria a tabela Frequ�ncia*/
Create table frequencia
(
Frequ�ncia varchar(2) not null,
DataAula Datetime not null
)

--Comandos para apagar as tabelas inteiramente se necess�rio
drop table escola
drop table cursoidioma
drop table turma
drop table aluno
drop table matricula
drop table frequencia


/*Seleciona todos os dados da tabela escola*/
select * from escola


/*Seleciona todos os dados da tabela cursoidioma*/
select * from cursoidioma


/*Seleciona todos os dados da tabela turma*/
select * from turma


/*Seleciona todos os dados da tabela aluno*/
select * from aluno


/*Seleciona todos os dados da tabela matricula*/
select * from matricula


/*Seleciona todos os dados da tabela frequencia*/
select * from frequencia


/*Adiciona a coluna CodEscola na tabela escola como chave prim�ria*/
alter table escola ADD CodEscola numeric(18,0) identity primary key


/*Adiciona a coluna CodCurso como chave prim�ria e a coluna CodEscola como chave estrangeira da tabela escola na tabela cursoidioma*/
alter table cursoidioma add CodCurso numeric(18,0) identity primary key
alter table cursoidioma add CodEscola numeric(18,0) references escola(CodEscola)


/*Adiciona a coluna CodTurma como chave prim�ria e a coluna CodCurso como chave estrangeira da tabela cursoidioma na tabela turma*/
alter table turma add CodTurma numeric(18,0) identity primary key
alter table turma add CodCurso numeric(18,0) references cursoidioma(CodCurso)


/*Adiciona a coluna CodAluno como chave prim�ria e a coluna CodTurma como chave estrangeira da tabela turma na tabela aluno*/
alter table aluno add CodAluno numeric(18,0) identity primary key
alter table aluno add Idade int

/*Adiciona a coluna CodTurma e a Coluna CodAluno comom chaves Prim�rias da tabela turma e aluno respectivamente natabela matricula*/
alter table matricula add CodTurma numeric(18,0) not null references turma(CodTurma)
alter table matricula add CodAluno numeric(18,0) not null references aluno(CodAluno)
alter table matricula add CONSTRAINT PKCodTurma Primary Key (CodTurma, CodAluno)


/*Adicina na tabela frequencia a Coluna DataAula,TurmaID e AlunoID como identificadores(Chave prim�ria) e AlunoID,TurmaID tamb�m s�o chaves estrangeiras*/
alter table frequencia add CodAluno numeric(18,0) not null references aluno(CodAluno)
alter table frequencia add CodTurma numeric(18,0) not null references turma(CodTurma)
alter table frequencia add CONSTRAINT PKCodFrequencia Primary Key (CodAluno, CodTurma, DataAula)
 


/*Insere dados na tabela escola*/
insert into escola values('Facens', 'Sorocaba', 'SP','5245747896','Alto Boa Vista','facens@facens.br',325448796,'45786910237','Sorocaba','2015-04-02'),
						 ('Uniso', 'S�o Paulo','SP','5245767896','Alto','uniso@uniso.br',325648796,'45786910237','Sorocaba','2014-09-02'),
						 ('Fatec', 'Sorocaba', 'SP','5245787896','Boa Vista','fatec@fatec.br',329448796,'45786910237','Sorocaba','2005-07-02'),
						 ('Unip', 'Osasco','SP','5245747996','Vista','unip@unip.br',325408796,'45786910237','Sorocaba','2015-04-01'),
						 ('Anhanguera', 'Jundia�', 'SP','5240747896','A Boa Vista','anhanguera@a.br',325448196,'45786910237','Sorocaba','2012-06-02')
						 

/*Insere dados na tabela cursoidioma*/
insert into cursoidioma values('Ingles',1,1,120.20,1),
							  ('Alemao',2,40,30.20,2),
							  ('Japones',3,40,500.10,3),
							  ('Mandarim',4,40,1200.40,4),
							  ('Espanhol',5,40,621.12,5)
/*Insere dados na tabela turma*/
insert into turma values('Manha','B�sico','2014-08-09','2014-12-09', 1),
				        ('Tarde','Intermedi�rio','2014-08-07','2015-01-07', 2),
				        ('Tarde','B�sico','2014-05-09','2015-03-09', 3),
				        ('Noite','B�sico','2011-08-10','2012-05-10', 4),
				        ('Manha','Avan�ado','2013-08-09','2013-09-09', 5)


/*Insere dados na tabela aluno*/
insert into aluno values('Bruno','Sorocaba','Rua 1','Boa Vista','SP','654646484','457879965214','bruno@nois.com','32554878','1996-02-02','2014-02-02','n',29),
					    ('Renato','Sorocaba','Rua 2','Boa Vista','SP','654646484','455875965214','renato@nois.com','34554878','1997-02-02','2011-02-02','N',25),
					    ('Everson','Sorocaba','Rua 3','Boa Vista','SP','654646484','455849995214','everson@nois.com','35554878','1998-02-02','2015-02-02','n',30),
					    ('Chris','Sorocaba','Rua 4','Boa Vista','SP','654646484','455279965614','chris@nois.com','37554878','1999-02-02','2014-02-02','n',42),
					    ('Rodrigo','Sorocaba','Rua 5','Boa Vista','SP','654646484','455379965214','rodrigo@nois.com','36554878','1979-02-02','2012-02-02','N',50)
						

/*Insere dados na tabela matricula*/
insert into matricula values(7.2,'2015-04-03',4,5),
							(7.3,'2015-04-03',2,2),
							(7.5,'2015-04-04',3,3),
							(7.8,'2015-04-05',4,4),
							(7.9,'2015-04-02',5,5)
							

/*Insere dados na tabela frequencia*/
insert into frequencia values('p','2015-01-01',1,1),
                             ('p','2015-01-01',2,2),
							 ('f','2015-01-01',3,3),
							 ('p','2015-01-01',4,4),
							 ('f','2015-01-01',5,5)


													/* ##### A - Subconsultas ##### */
	--PROBLEMA
/*1. D� exemplo de um comando utilizando subconsultas que utilize o operador = ou <,>, <= etc. */

--DESCRI��O DO QUE O COMANDO FAZ
/* O comando abaixo Seleciona a coluna NOTA da tabela matr�cula em que os valores do campo NOTA forem maiores que 7 */
Select Nota From matricula where Nota > 7



	--PROBLEMA
/* 2. D� exemplo de um comando utilizando subconsultas que utilize o operador in. */

--DESCRI��O DO QUE O COMANDO FAZ
/* O comando abaixo utiliza a consulta mais interna (subconsulta, entre parenteses ap�s o in) para selecionar a coluna CodCurso ap�s a jun��o das tr�s tabelas.
Ap�s essa subconsulta ser feita a consulta mais externa (a que est� antes do in) utiliza os dados retornados pela subconsulta para comparar se os valores do campo CodCurso
da tabela cursoidioma est�o ou s�o iguais aos valores que foram selecionados pela subconsulta. Se sim, � selecionado o valor da coluna Dura��o da tabela
cursoidioma e mostrado na tela.
*/
Select Duracao from cursoidioma where CodCurso in ( Select t.CodCurso from turma t inner join matricula m
																				on
																				t.CodTurma = m.CodTurma
																				inner join frequencia f 
																				on
																				f.CodTurma = t.CodTurma and f.Frequ�ncia = 'p'
																				)

	--PROBLEMA
/*3. D� exemplo de um comando utilizando subconsultas que utilize o operador not in.*/

--DESCRI��O DO QUE O COMANDO FAZ
/* O comando abaixo seleciona o conte�do do campo CodEscola, Nome, Cidade da tabela escola onde o conte�do do campo Cidade da tabela escola n�o esteja
cadastrado na tabela aluno
*/

select CodEscola, Nome, Cidade from escola where Cidade not in (select Cidade from aluno)

--os selects abaixo server para simples confer�ncia
select * from escola
select * from aluno


	--PROBLEMA
/* 4. D� exemplo de um comando utilizando subconsultas que utilize o operador exists */

--DESCRI��O DO QUE O COMANDO FAZ
/* O comando abaixo faz o seguinte:
Basta uma condi��o ser verdadeira na subconsulta que ele seleciona todos os valores da coluna N�vel da tabela turma.

Para comprovar essa explica��o, o mesmo comando foi refeito, agora ele ser� igual a apenas a um valor t.CodCurso = 4..
Agora, se for falsa ou seja se a subconsulta n�o selecionar nenhuma linha (Numero de linhas = 0) a consulta externa n�o � executada.

 */

select Nivel from turma where EXISTS ( select * from cursoidioma c inner join turma t on  t.CodCurso = c.CodCurso) --�nico comando v�lido, os demais foi apenas para exemplifica��o do que o comando faz

select Nivel from turma where EXISTS ( select * from cursoidioma c inner join turma t on  t.CodCurso = 4) --Comando v�lido, ter� o mesmo efeito do comando acima

select Nivel from turma where EXISTS ( select * from cursoidioma c inner join turma t on  t.CodCurso = -10) --Condi��o falsa, a consulta externa n�o chega a ser executada

	--PROBLEMA
/* 5. D� exemplo de um comando utilizando subconsultas que utilize o operador not  exists. */

--DESCRI��O DO QUE O COMANDO FAZ
/* o comando abaixo faz o seguinte:
Ele � o oposto do comando EXISTS, pois basta que uma condi��o seja falsa para ele trazer todos os campos selecionados na colsulta externa.
Assim como no problema 4, foi colocado alguns exemplos para auxiliar na explica��o.

*/
select Nivel from turma where NOT EXISTS( select * from cursoidioma c inner join turma t on  t.CodCurso = -90) -- �nico comando v�lido, os demais foi apenas para exemplifica��o do que o comando faz

select Nivel from turma where NOT EXISTS( select * from cursoidioma c inner join turma t on  t.CodCurso = c.CodCurso) --Condi��o verdadeira, a consulta externa n�o chega a ser executada

select Nivel from turma where NOT EXISTS( select * from cursoidioma c inner join turma t on  t.CodCurso = 1) --Condi��o verdadeira, a consulta externa n�o chega a ser executada



	--PROBLEMA
/* 6. D� exemplo de uma subconsulta utilizada dentro de um comando Update. */

--DESCRI��O DO QUE O COMANDO FAZ
/* O comando abaixo na condi��o where utiliza uma subconsulta a qual tem a finalidade de selecionar a menor NOTA da tabela matr�cula e compara com o campo NOTA da
mesma tabela (matr�cula) se a condi��o for satisfeita, isto �, se for verdadeira, ent�o o campo Nota � atualizado (UPDATE) com um aumento de 10% no valor atual desse campo.
*/

--seleciona toda a informa��o da tabela matricula antes que o comando abaixo seja executado
select * from matricula

update matricula set Nota = Nota * 1.1 where  Nota = (select min(Nota) from matricula)

--seleciona a tabela matricula ap�s o comando acima para verificar o efeito do comando
select * from matricula



	--PROBLEMA
/* 7. D� exemplo de uma subconsulta utilizada dentro de um comando Delete. */

--DESCRI��O DO QUE O COMANDO FAZ
/* O comando abaixo seleciona a Data de Matr�cula mais recente da tabela matricula.
Compara com com cada campo DataMatricula da mesma tabela (matr�cula), se a condi��o da compara��o for stisfeita, isto �, se for verdadeira, a linha inteira que cont�m essa
informa��o � deletada da tabela.
*/

--seleciona toda a informa��o da tabela matr�cula antes do comando abaixo seja executado
select * from matricula

delete from matricula where DataMatricula = (select max(DataMatricula) from matricula)

--seleciona a tabela matr�cula apos o comando acima para verificar o efeito do comando
select * from matricula



													/* ##### B - Transact SQL ##### */


	--PROBLEMA
/* 8. Escreva uma fun��o que seja �til para a l�gica de neg�cios de seu sistema e indique o contexto de sua utiliza��o. */

--DESCRI��O DO QUE O COMANDO FAZ

/*	----- 
Esse metodo de negocio � usado function table que retorna o nome dos alunos na consulta mais externa, e na consulta mas interna ( subcosulta) retorna
a nota do aluno e a nota que for maior ou igual a passada por par�metro ganhar� uma viagem para o pais de origem do curso de lingua em que se est� 
matriculado.

Obs.: Pode haver mais de um ganhador, podendo inclusive todos os alunos ganhar a viagem. 

*/



CREATE FUNCTION fnReturnMelhorAluno(@nota numeric(18,2))
		RETURNS TABLE
AS
	RETURN
			(SELECT a.NomeAluno  as Nome_Aluno_Vencedor_da_Viagem
	
			FROM 
					aluno a INNER JOIN matricula m
					ON a.CodAluno = m.CodAluno
			
			WHERE m.CodTurma IN (SELECT CodTurma
							
							FROM
									matricula m

							WHERE m.Nota >= @nota))

--seleciona todos os dados da tabela matricula para que possa ver a nota e utilizar na fun��o
select * from matricula

SELECT * FROM DBO.fnReturnMelhorAluno(7.3)
							

	--PROBLEMA
/* 9. Escreva uma Stored Procedure que implemente uma regra de neg�cio de sua aplica��o.Explique qual � e o porque desta regra ser implementada no SGBD. */

--DESCRI��O DO QUE O COMANDO FAZ

/* O comando pega o nome do aluno matriculado na escola e sua idade, aquele cujo a idade � maior ou igual a 40 tem um desconto
na mensalidade para incentivar pessoas a estudarem outro idioma.O desconto ser� de 45%.

Esta regra foi implementado no SGBD para facilitar as tarefas internas que ser�o realizadas pelos funcion�rios da escola e tamb�m para dar seguran�a a informa��o,
n�o podendo o aluno que j� recebeu desconto mentir e isso vale para aqueles que tamb�m n�o atendem o requisito necess�rio para receber o desconto que � a idade.

 */


create procedure spImpleNegocio
		@Idaluno int
AS
BEGIN
		DECLARE @ret varchar(50),
				@Idade int

		SELECT	@ret = NomeAluno, @Idade = Idade

		FROM	aluno

		WHERE	CodAluno = @Idaluno  

		

		IF (@Idade >= 40 and ((select PossuiDesconto from aluno where CodAluno = @Idaluno) = 'N' or (select PossuiDesconto from aluno where CodAluno = @Idaluno) = 'n'))
		BEGIN
				print @ret + ' Recebe desconto para alunos com idade maior ou igual a 40. O valor de Desconto recebido na mensalidade � de 45%'
				update cursoidioma set ValorMensalidade = ValorMensalidade * 0.55 where CodCurso in (Select ci.CodCurso from 
																										aluno a inner join matricula m
																										on
																										a.CodAluno = m.CodAluno and a.CodAluno = @Idaluno
																										inner join turma t
																										on
																										t.CodTurma = m.CodTurma
																										inner join cursoidioma ci
																										on
																										ci.CodCurso = t.CodCurso
																										
																										)

				update aluno set PossuiDesconto = 's' where CodAluno = @Idaluno
		END

		ELSE
			BEGIN
					print @ret +' n�o recebe desconto. Por n�o ter idade compativel ou por j� possuir desconto.'
			END
END

exec spImpleNegocio 4

--comando abaixo serve para verificar o resultado da procedure acima

select * from aluno
select * from cursoidioma
/* 10. De acordo com o tema escolhido, escreva um procedimento armazenado (Stored Procedure)  para calcular totaliza��es do sistema. Esta totaliza��o deve ser exibida como resultado do procedimento ou gravada em alguma tabela.
	Exemplo:
Valor total da loca��o de autom�vel (di�rias + seguro + danos, se houver) => para  tema da Locadora de ve�culos
Total de freq��ncia do aluno no curso => calculado a partir do registro di�rio de frequ�ncia do aluno no curso => para tema da Escola de Idiomas */

--DESCRI��O DO QUE O COMANDO FAZ

/* O comando abaixo recebe o c�digo do aluno como par�metro, baseado nisso mostra quantas aulas (total) o aluno teve at�
o momento da consulta e verifica quantas faltas e presen�a o mesmo possu� em rela��o ao total de aulas*/

SELECT * from frequencia
--comando utilizado para ver o efeito da procedure
insert into frequencia values('p','2015-01-02',4,4)
insert into frequencia values('f','2015-01-03',4,4)
insert into frequencia values('p','2015-01-04',4,4)
insert into frequencia values('f','2015-01-05',4,4)
insert into frequencia values('p','2015-01-06',4,4)
insert into frequencia values('f','2015-01-07',4,4)
insert into frequencia values('p','2015-01-08',4,4)
insert into frequencia values('p','2015-01-09',4,4)
insert into frequencia values('f','2015-01-10',4,4) 

create procedure spcalcula 
		@CodAluno numeric(18,0)
as
begin

declare @Frequencia varchar(2), @CodAluno2 numeric(18,0)
		declare curp cursor
		for
		select Frequ�ncia, CodAluno from frequencia
		
		open curp

		fetch next from curp into @Frequencia, @CodAluno2

		declare @contador int
		declare @contf int
		declare @soma int
		set @contador = 0
		set @contf = 0
		set @soma = 0

		while @@FETCH_STATUS = 0
	begin
		
		if(@Frequencia = 'p' and @CodAluno = @CodAluno2)
		begin
		set @contador = @contador + 1
		set @soma = @soma + 1
		end


		else if(@Frequencia = 'f' and @CodAluno = @CodAluno2)
		begin
		set @contf = @contf + 1
		set @soma = @soma + 1
		end

		fetch next from curp into @Frequencia, @CodAluno2
	end

		close curp
		deallocate curp
print'Total de Aulas que o aluno teve at� agora:'
print +@soma
print 'Quantidade de Presenca: '
print  @contador

print'Quantidade de Ausencia: '
print +@contf

end


select * from frequencia
Exec spcalcula 4

	--PROBLEMA
/* 11. Escreva um trigger para suportar auditoria quanto � exclus�o, altera��o e inclus�o de registros da seguinte forma:

Toda vez que um registro for inclu�do, exclu�do ou alterado da tabela principal de seu sistema, o trigger dever� gravar uma tabela de log com: 
Para exclus�o: data e hora da opera��o, chave do registro exclu�do, nome da tabela e o usu�rio que disparou a exclus�o.
Para inclus�o: data e hora da opera��o, chave do registro inclu�do, nome da tabela e o usu�rio que disparou a inclus�o.
Para altera��o: data e hora da opera��o, chave do registro alterado, nome da tabela e o usu�rio que disparou a altera��o, valor anterior e atual do campo alterado. */

--DESCRI��O DO QUE O COMANDO FAZ

-- Criar tabela Logs que ir� conter o hist�rico das altera��es

create table Logs
(
LogID			int	identity not null,
TipoAltera��o	varchar(255) not null,
DataAltera��o	datetime not null,
TabelaAlterada	varchar(255)not null,
ChaveRegisro	varchar (255)not null,
Usuario			varchar(255)not null,
ValorAnterior	varchar(255)null,
ValorAtual		varchar(255)null
)

 --Criar e inserir valores na tabela Usuario 

create table Usuario
(
CodUsuario int identity primary key not null,
Nome varchar (255) not null,
Cargo varchar(255) not null,
Estatus varchar (255) not null
)

insert into Usuario values
('Rafael','Professor','Ativo'),
('Patricia','Professor','Ativo'),
('Thomas','Gerente','Ativo'),
('Amanda','Secretaria','Ativo'),
('Milena','Secretaria','Ativo')

select *from usuario

--O Codigo cria a Trigger para fazer o Log das informa��es na tabela "Logs" ap�s alguma linha da tabela Escola (Tabela Principal) ser deletada.
--Ap�s a exclus�a�, a trigger declara uma variavel que representa o usuario logado que deletou o dado, e faz o adiciona a informa��o na tabela Logs.
--Dar� um erro devido as depemdencias com outras tabelas, tentamos deletar as linhas das tabelas afetadas mas deixamos como comentario na Trigger 

create trigger trAuditoriaI on Escola
after delete
as
	begin
		declare @UsuarioLogado int
		set @UsuarioLogado=4 --O usuario logado � de CodUsuario igual a 4 (Amanda)

			--delete from matricula where codturma =4
			--delete from frequencia where codturma=4
			--delete from turma where codcurso = 4
			--delete from cursoidioma where CodEscola = 4 --(select codescola from deleted)
		
		insert into Logs values
		('Exclus�o',getdate(),'Escola',(select CodEscola from deleted),(select Nome from usuario where codusuario=@UsuarioLogado),'-','-')
	End

--Validando trigger deletando uma linha da tabela escola

select*from escola

Delete from escola where CodEscola = 3

select*from escola
select*from logs


-- Ap�s uma adi��o de dado feito na tabela Escola, o codigo abaixo simula um usuario logado declarando um variavel, e insere o acrecimo feito na tabela log.

create trigger trAuditoriaII on escola
after insert
as
	begin
		declare @UsuarioLogado int
		set @UsuarioLogado=5 --O usuario logado � de CodUsuario igual a 5 (Milena)

		insert into logs values
		('Inclus�o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario=5),'-','-')

	end

--Validando trigger, inserindo valores na tabala Escola

insert into escola values
('ESANC2', 'Sorocaba', 'SP','10234987','Vista Boa','esanc@a.br',322345342,'12343000123','Rua 1','2015-07-19'),
('Uirapuru2', 'Sorocaba', 'SP','182284958','Campolim','uiapuru@a.br',12238763,'34565443322','Avenida 1','2015-03-25')
select*from escola
select*from Logs

-- Essa trigger � acionada ap�s alguma atualiza��o na tabela escola, ela simula um usuario do sistema e adiciona o valor alterado (antigo) e o novo valor, na tabela Logs.
-- O codigo checa coluna a coluna para poder registrar o valor correto na tabela Logs.

create trigger trAuditoriaIII on escola
after update
as
begin
	declare @UsuarioLogado int
	set @UsuarioLogado=3 --O usuario logado � de CodUsuario igual a 3 (Thomas)

	if update (nome)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Nome from deleted),(select Nome from inserted))
		end	
	else if update (Cidade)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Cidade from deleted),(select Cidade from inserted))
		end
	else if update (Estado)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Estado from deleted),(select Estado from inserted))
		end
	else if update (CEP)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select CEP from deleted),(select CEP from inserted))
		end
	else if update (Bairro)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Bairro from deleted),(select Bairro from inserted))
		end
	else if update (Email)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Email from deleted),(select Email from inserted))
		end
	else if update (Telefone)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Telefone from deleted),(select Telefone from inserted))
		end
	else if update (CNPJ)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select CNPJ from deleted),(select CNPJ from inserted))
		end
	else if update (Endereco)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Endereco from deleted),(select Endereco from inserted))
		end
	else if update (DataCadastro)
		begin
			insert into Logs values
			('Altera��o',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select DataCadastro from deleted),(select DataCadastro from inserted))
		end

		Select * From Logs
end

-- Validando altera��o na tabela Logs ao atualizar algum dado da tabela escola.

update escola set Cidade = 'Pato Brmco' where nome ='uniso'
update escola set Estado = 'PR' where nome ='uniso'
update escola set Bairro = 'Vai Saber' where nome ='uniso'
update escola set Endereco = 'Rua de Longe' where nome ='uniso'


select *from escola

delete from Logs where logid=2


	--PROBLEMA
/* 12. De acordo com o tema  escolhido, escreva um trigger para realizar uma a��o autom�tica que seja  necess�ria para o  sistema manter a  integridade dos dados.
		Exemplo:
Cada vez que for inserida a matr�cula de um aluno no curso, diminuir o n�mero de vagas dispon�veis no curso =>  para tema da Escola de Idiomas
Cada vez que uma loca��o for encerrada, calcular o total de pontos de fidelidade =>  para tema da  Locadora de ve�culos
Atualizar o saldo banc�rio cada vez que ocorrer um lan�amento de d�bito ou cr�dito=> para o Tema de Contas correntes banc�rias.
Etc. */

--DESCRI��O DO QUE O COMANDO FAZ

/* o comando abaixo faz o seguinte:
					Cada vez que for inserida a matr�cula de um aluno no curso, � subtra�do em um o n�mero de vagas atualmente dispon�veis no curso.
O comando n�o � executado se a quantidade de vagas dispon�vel for 0 ou menor que 0, pois a� o curso estaria com a turma completa.

*/


create trigger tgrcontrole on matricula
instead of insert
as
begin

if ((select c.VagasDisponiveis from inserted i inner join turma t 
on
i.CodTurma = t.CodTurma
inner join cursoidioma c
on
c.CodCurso = t.CodCurso) > 0)

begin

update cursoidioma set VagasDisponiveis = VagasDisponiveis - 1 where CodCurso = (select c.CodCurso from
																						inserted i inner join turma t
																						on
																						i.CodTurma = t.CodTurma
																						inner join cursoidioma c
																						on
																						c.CodCurso = t.CodCurso
																								
)

insert into matricula select Nota, DataMatricula, CodTurma, CodAluno from inserted

end

else
begin

raiserror('O curso escolhido nao possui mais vagas dispon�veis, a turma atual est� completa!', 13,1,1)

end

select * from cursoidioma

end

--O comandos Abaixo servem Apenas para testar o trigger acima

insert into turma values('Manha','B�sico','2014-08-09','2014-12-09', 1)
insert into aluno values('Bruno','Sorocaba','Rua 1','Boa Vista','SP','654646484','457879965214','bruno@nois.com','32554878','1996-02-02','2014-02-02','n',29)
insert into matricula values(7.2,'2015-04-03',9,6)


select * from turma
select * from aluno
select * from matricula
select * from cursoidioma


	--PROBLEMA
/* 13. Escreva um procedimento que necessite da utiliza��o de cursores.
Lembre-se o uso de cursores � interessante quando precisamos trabalhar com um conjunto de linhas e tratando cada linha de maneira individual. */

--DESCRI��O DO QUE O COMANDO FAZ
/* O comando abaixo seleciona alguns campos da tabela aluno como Nome do Aluno, Cidade, Endereco e Telefone
e nos mostra com a numera��o acima de todas essas informa��es para f�cil verifica��o de quantos alunos existem na tabela.
*/

create procedure prcur
as
begin
		declare
				@NomeAluno varchar(100),
				@Cidade varchar(50),
				@Endereco varchar(100),
				@Telefone Varchar(30)

		declare curaluno cursor
		for
		select NomeAluno, Cidade, Endereco, Telefone from aluno

		open curaluno

		fetch next from curaluno into @NomeAluno, @Cidade, @Endereco, @Telefone

		declare @contador int
		set @contador = 1

		while @@FETCH_STATUS = 0
	begin

		print @contador
		print 'Nome do Aluno: ' +@NomeAluno
		print 'Cidade do Aluno: ' +@Cidade
		print 'Endereco do Aluno: ' +@Endereco
		print 'Telefone do Aluno: ' +@Telefone
		print''

		set @contador = @contador + 1

		fetch next from curaluno into @NomeAluno, @Cidade, @Endereco, @Telefone
	end

		close curaluno
		deallocate curaluno

end

execute prcur