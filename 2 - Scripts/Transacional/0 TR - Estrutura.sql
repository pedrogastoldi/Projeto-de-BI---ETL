
CREATE SEQUENCE public.filial_cod_filial_seq;

CREATE TABLE public.FILIAL (
                cod_filial INTEGER NOT NULL DEFAULT nextval('public.filial_cod_filial_seq'),
                CNPJ VARCHAR(20) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                CONSTRAINT cod_filial PRIMARY KEY (cod_filial)
);


ALTER SEQUENCE public.filial_cod_filial_seq OWNED BY public.FILIAL.cod_filial;

CREATE SEQUENCE public.endereco_filial_cod_endereco_fil_seq;

CREATE TABLE public.ENDERECO_FILIAL (
                cod_endereco_fil INTEGER NOT NULL DEFAULT nextval('public.endereco_filial_cod_endereco_fil_seq'),
                tipo_log VARCHAR(10) NOT NULL,
                logradouro VARCHAR(50) NOT NULL,
                numero INTEGER NOT NULL,
                complemento VARCHAR(50) NOT NULL,
                bairro VARCHAR(50) NOT NULL,
                UF VARCHAR(2) NOT NULL,
                CEP VARCHAR(9) NOT NULL,
                cod_filial INTEGER NOT NULL,
                CONSTRAINT cod_endereco_fil PRIMARY KEY (cod_endereco_fil)
);


ALTER SEQUENCE public.endereco_filial_cod_endereco_fil_seq OWNED BY public.ENDERECO_FILIAL.cod_endereco_fil;

CREATE SEQUENCE public.telefone_filial_cod_tel_fil_seq;

CREATE TABLE public.TELEFONE_FILIAL (
                cod_tel_fil INTEGER NOT NULL DEFAULT nextval('public.telefone_filial_cod_tel_fil_seq'),
                DDD INTEGER NOT NULL,
                telefone VARCHAR(15) NOT NULL,
                cod_filial INTEGER NOT NULL,
                CONSTRAINT cod_tel_fil PRIMARY KEY (cod_tel_fil)
);


ALTER SEQUENCE public.telefone_filial_cod_tel_fil_seq OWNED BY public.TELEFONE_FILIAL.cod_tel_fil;

CREATE SEQUENCE public.bicicleta_cod_bicicleta_seq;

CREATE TABLE public.BICICLETA (
                cod_bicicleta INTEGER NOT NULL DEFAULT nextval('public.bicicleta_cod_bicicleta_seq'),
                vl_hora REAL NOT NULL,
                marca VARCHAR(50) NOT NULL,
                modelo VARCHAR(50) NOT NULL,
                tipo VARCHAR(50) NOT NULL,
                CONSTRAINT cod_bicicleta PRIMARY KEY (cod_bicicleta)
);


ALTER SEQUENCE public.bicicleta_cod_bicicleta_seq OWNED BY public.BICICLETA.cod_bicicleta;

CREATE TABLE public.BICICLETA_FILIAL (
                qtde_bicicletas INTEGER NOT NULL,
                cod_filial INTEGER NOT NULL,
                cod_bicicleta INTEGER NOT NULL
);


CREATE SEQUENCE public.pessoa_cod_pessoa_seq;

CREATE TABLE public.PESSOA (
                cod_pessoa INTEGER NOT NULL DEFAULT nextval('public.pessoa_cod_pessoa_seq'),
                nome VARCHAR(50) NOT NULL,
                cpf VARCHAR(12) NOT NULL,
                email VARCHAR(50) NOT NULL,
                CONSTRAINT cod_pessoa PRIMARY KEY (cod_pessoa)
);


ALTER SEQUENCE public.pessoa_cod_pessoa_seq OWNED BY public.PESSOA.cod_pessoa;

CREATE SEQUENCE public.endereco_pessoa_cod_endereco_pes_seq;

CREATE TABLE public.ENDERECO_PESSOA (
                cod_endereco_pes INTEGER NOT NULL DEFAULT nextval('public.endereco_pessoa_cod_endereco_pes_seq'),
                tipo_log VARCHAR(10) NOT NULL,
                logradouro VARCHAR(50) NOT NULL,
                numero INTEGER NOT NULL,
                complemento VARCHAR(50) NOT NULL,
                bairro VARCHAR(50) NOT NULL,
                UF VARCHAR(2) NOT NULL,
                CEP VARCHAR(9) NOT NULL,
                cod_pessoa INTEGER NOT NULL,
                CONSTRAINT cod_endereco_pes PRIMARY KEY (cod_endereco_pes)
);


ALTER SEQUENCE public.endereco_pessoa_cod_endereco_pes_seq OWNED BY public.ENDERECO_PESSOA.cod_endereco_pes;

CREATE SEQUENCE public.telefone_pessoa_cod_tel_pes_seq;

CREATE TABLE public.TELEFONE_PESSOA (
                cod_tel_pes INTEGER NOT NULL DEFAULT nextval('public.telefone_pessoa_cod_tel_pes_seq'),
                telefone VARCHAR(15) NOT NULL,
                DDD INTEGER NOT NULL,
                cod_pessoa INTEGER NOT NULL,
                CONSTRAINT cod_tel_pes PRIMARY KEY (cod_tel_pes, telefone)
);


ALTER SEQUENCE public.telefone_pessoa_cod_tel_pes_seq OWNED BY public.TELEFONE_PESSOA.cod_tel_pes;

CREATE SEQUENCE public.funcionario_cod_func_seq;

CREATE TABLE public.FUNCIONARIO (
                cod_func INTEGER NOT NULL DEFAULT nextval('public.funcionario_cod_func_seq'),
                cod_pessoa INTEGER NOT NULL,
                cod_filial INTEGER NOT NULL,
                CONSTRAINT cod_func PRIMARY KEY (cod_func)
);


ALTER SEQUENCE public.funcionario_cod_func_seq OWNED BY public.FUNCIONARIO.cod_func;

CREATE SEQUENCE public.cliente_cod_cli_seq;

CREATE TABLE public.CLIENTE (
                cod_cli INTEGER NOT NULL DEFAULT nextval('public.cliente_cod_cli_seq'),
                cod_pessoa INTEGER NOT NULL,
                CONSTRAINT cod_cli PRIMARY KEY (cod_cli)
);


ALTER SEQUENCE public.cliente_cod_cli_seq OWNED BY public.CLIENTE.cod_cli;

CREATE SEQUENCE public.aluga_cod_locacao_seq;

CREATE TABLE public.ALUGA (
                cod_locacao INTEGER NOT NULL DEFAULT nextval('public.aluga_cod_locacao_seq'),
                dt_locacao DATE NOT NULL,
                hora_locacao TIME NOT NULL,
                tempo_locacao INTEGER NOT NULL,
                desconto INTEGER NOT NULL,
                cod_cli INTEGER NOT NULL,
                cod_func INTEGER NOT NULL,
                cod_bicicleta INTEGER NOT NULL,
                cod_filial INTEGER NOT NULL,
                CONSTRAINT cod_locacao PRIMARY KEY (cod_locacao)
);


ALTER SEQUENCE public.aluga_cod_locacao_seq OWNED BY public.ALUGA.cod_locacao;

ALTER TABLE public.TELEFONE_FILIAL ADD CONSTRAINT filial_telefone_filial_fk
FOREIGN KEY (cod_filial)
REFERENCES public.FILIAL (cod_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ENDERECO_FILIAL ADD CONSTRAINT filial_endereco_pessoa_1_fk
FOREIGN KEY (cod_filial)
REFERENCES public.FILIAL (cod_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.BICICLETA_FILIAL ADD CONSTRAINT filial_bicicleta_filial_fk
FOREIGN KEY (cod_filial)
REFERENCES public.FILIAL (cod_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.FUNCIONARIO ADD CONSTRAINT filial_funcionario_fk
FOREIGN KEY (cod_filial)
REFERENCES public.FILIAL (cod_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ALUGA ADD CONSTRAINT filial_aluga_fk
FOREIGN KEY (cod_filial)
REFERENCES public.FILIAL (cod_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.BICICLETA_FILIAL ADD CONSTRAINT bicicleta_bicicleta_filial_fk
FOREIGN KEY (cod_bicicleta)
REFERENCES public.BICICLETA (cod_bicicleta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ALUGA ADD CONSTRAINT bicicleta_aluga_fk
FOREIGN KEY (cod_bicicleta)
REFERENCES public.BICICLETA (cod_bicicleta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.CLIENTE ADD CONSTRAINT pessoa_cliente_fk
FOREIGN KEY (cod_pessoa)
REFERENCES public.PESSOA (cod_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.FUNCIONARIO ADD CONSTRAINT pessoa_funcionario_fk
FOREIGN KEY (cod_pessoa)
REFERENCES public.PESSOA (cod_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.TELEFONE_PESSOA ADD CONSTRAINT pessoa_telefone_fk
FOREIGN KEY (cod_pessoa)
REFERENCES public.PESSOA (cod_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ENDERECO_PESSOA ADD CONSTRAINT pessoa_enderecos_fk
FOREIGN KEY (cod_pessoa)
REFERENCES public.PESSOA (cod_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ALUGA ADD CONSTRAINT funcionario_aluga_fk
FOREIGN KEY (cod_func)
REFERENCES public.FUNCIONARIO (cod_func)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ALUGA ADD CONSTRAINT cliente_aluga_fk
FOREIGN KEY (cod_cli)
REFERENCES public.CLIENTE (cod_cli)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
