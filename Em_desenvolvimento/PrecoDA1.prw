#include 'protheus.ch'
#include 'parmtype.ch'


/*/{Protheus.doc} fPrecoDA1
Função que retorna o preço do produto.
A função foi criada para alimentar os campos B1_XPRCVEN. 
@author jerfferson.silva
@since 30/01/2018
@version 1.0
@return nRet, numerico, Saldo do produto na tabela DA1.
@param cTabela, characters, descricao
@type function
/*/
User Function fPrecoDA1(cTabela)

	Local 	nRet := 0
	Default cTabela := AllTrim(SuperGetMV("MV_TABPAD",,"001")) //Parametro de tabela de preço padrão
	
	DbSelectArea("DA1")//Tabela de Saldos Fisico
	DbSetOrder(1)
	If DbSeek(xFilial("DA1") + cTabela + SB1->B1_COD)
		nRet := DA1->DA1_PRCVEN
	EndIf
	
Return (nRet)