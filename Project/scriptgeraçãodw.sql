
CREATE TABLE public.dim_filial (
                sk_filial INTEGER NOT NULL,
                nk_filial INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                endereco VARCHAR(50) NOT NULL,
                CONSTRAINT dim_filial PRIMARY KEY (sk_filial)
);


CREATE TABLE public.dim_cliente (
                sk_cliente INTEGER NOT NULL,
                nk_cliente INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                idade NUMERIC(10) NOT NULL,
                CONSTRAINT dim_cliente PRIMARY KEY (sk_cliente)
);


CREATE TABLE public.dim_funcionario (
                sk_funcionario INTEGER NOT NULL,
                nk_funcionario VARCHAR NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                CONSTRAINT sk_funcionario PRIMARY KEY (sk_funcionario)
);


CREATE TABLE public.dim_produto (
                sk_produto INTEGER NOT NULL,
                nk_produto INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                preco NUMERIC(10,2) NOT NULL,
                CONSTRAINT sk_produto PRIMARY KEY (sk_produto)
);


CREATE TABLE public.ft_compras (
                sk_cliente INTEGER NOT NULL,
                sk_funcionario INTEGER NOT NULL,
                sk_produto INTEGER NOT NULL,
                sk_filial INTEGER NOT NULL,
                md_qtd INTEGER NOT NULL,
                CONSTRAINT sk_compras PRIMARY KEY (sk_cliente, sk_funcionario, sk_produto, sk_filial)
);


ALTER TABLE public.ft_compras ADD CONSTRAINT dim_filial_ft_compras_fk
FOREIGN KEY (sk_filial)
REFERENCES public.dim_filial (sk_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_compras ADD CONSTRAINT dim_cliente_ft_compras_fk
FOREIGN KEY (sk_cliente)
REFERENCES public.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_compras ADD CONSTRAINT dim_funcionario_ft_compras_fk
FOREIGN KEY (sk_funcionario)
REFERENCES public.dim_funcionario (sk_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_compras ADD CONSTRAINT dim_produto_ft_compras_fk
FOREIGN KEY (sk_produto)
REFERENCES public.dim_produto (sk_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
