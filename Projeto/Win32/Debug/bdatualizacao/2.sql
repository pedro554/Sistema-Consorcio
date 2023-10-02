CREATE PROCEDURE VerificarMovimentoAntesDeletarCliente(IN ClienteID INT)
BEGIN
	DECLARE row_count INT;
	SELECT COUNT(*) INTO row_count
	FROM crm
	WHERE crm.CD_CLIENTE = ClienteID;

	IF row_count > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Nao e possivel excluir este registro, pois ja possui movimento!';
	END IF;
END;

CREATE TRIGGER cliente_before_delete BEFORE DELETE ON cliente FOR EACH ROW
BEGIN
	CALL VerificarMovimentoAntesDeletarCliente(OLD.CD_CLIENTE);
END;

CREATE TRIGGER `faixacomissao_before_delete` BEFORE DELETE ON faixacomissao FOR EACH ROW 
BEGIN
	CALL VerificarMovimentoAntesDeletarCliente(OLD.CD_FAIXACOMISSAO);
END;

CREATE TRIGGER `funcionario_before_delete` BEFORE DELETE ON `funcionario` FOR EACH ROW 
BEGIN
	CALL VerificarMovimentoAntesDeletarCliente(OLD.CD_FUNCIONARIO);
END;
