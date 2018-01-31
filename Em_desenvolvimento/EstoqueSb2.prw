#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} fEstoqSb2
Função que retorna saldo do produto.
A função foi criada para alimentar os campos B1_XESTOQ1 e B1_XESTOQ2. 
@author jerfferson.silva
@since 30/01/2018
@version 1.0
@return nRet, numerico, Saldo do produto na tabela SB2
@param cArmaz, characters, Armazem para consulta do saldo
/*/
User Function fEstoqSb2(cArmaz)

	Local nRet 		:= 0
	Default cArmaz	:= IF(EMPTY(SB1->B1_LOCPAD),"01",SB1->B1_LOCPAD)

	DbSelectArea("SB2")//Tabela de Saldos Fisico
	DbSetOrder(1)
	DbSeek(xFilial("SB2") + SB1->B1_COD + cArmaz)

	//Consultando Saldo
	nRet := SaldoSb2()

return nRet