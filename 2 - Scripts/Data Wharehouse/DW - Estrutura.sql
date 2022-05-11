
CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL,
                nk_data DATE NOT NULL,
                desc_data_completa VARCHAR(60) NOT NULL,
                nr_ano INTEGER NOT NULL,
                nm_trimestre VARCHAR(20) NOT NULL,
                nr_ano_trimestre VARCHAR(20) NOT NULL,
                nr_mes INTEGER NOT NULL,
                nm_mes VARCHAR(20) NOT NULL,
                ano_mes VARCHAR(20) NOT NULL,
                nr_semana INTEGER NOT NULL,
                ano_semana VARCHAR(20) NOT NULL,
                nr_dia INTEGER NOT NULL,
                nr_dia_ano INTEGER NOT NULL,
                nm_dia_semana VARCHAR(20) NOT NULL,
                flag_final_semana CHAR(3) NOT NULL,
                flag_feriado CHAR(3) NOT NULL,
                nm_feriado VARCHAR(60) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                CONSTRAINT sk_data_pk PRIMARY KEY (sk_data)
);


CREATE SEQUENCE public.dim_filial_sk_filial_seq;

CREATE TABLE public.dim_filial (
                sk_filial INTEGER NOT NULL DEFAULT nextval('public.dim_filial_sk_filial_seq'),
                nk_filial INTEGER NOT NULL,
                nm_filial VARCHAR(50) NOT NULL,
                etl_versao INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                CONSTRAINT sk_filial PRIMARY KEY (sk_filial)
);


ALTER SEQUENCE public.dim_filial_sk_filial_seq OWNED BY public.dim_filial.sk_filial;

CREATE SEQUENCE public.dim_funcionario_sk_funcionario_seq;

CREATE TABLE public.dim_funcionario (
                sk_funcionario INTEGER NOT NULL DEFAULT nextval('public.dim_funcionario_sk_funcionario_seq'),
                nk_funcionario INTEGER NOT NULL,
                nm_funcionario VARCHAR(50) NOT NULL,
                etl_versao INTEGER NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                CONSTRAINT sk_funcionario PRIMARY KEY (sk_funcionario)
);


ALTER SEQUENCE public.dim_funcionario_sk_funcionario_seq OWNED BY public.dim_funcionario.sk_funcionario;

CREATE SEQUENCE public.dim_bicicleta_sk_bicicleta_seq;

CREATE TABLE public.dim_bicicleta (
                sk_bicicleta INTEGER NOT NULL DEFAULT nextval('public.dim_bicicleta_sk_bicicleta_seq'),
                nk_bicicleta INTEGER NOT NULL,
                valor_loc_bicicleta NUMERIC(10,2) NOT NULL,
                marca VARCHAR(50) NOT NULL,
                modelo VARCHAR(50) NOT NULL,
                tipo VARCHAR(50) NOT NULL,
                etl_versao INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                CONSTRAINT sk_bicicleta PRIMARY KEY (sk_bicicleta)
);


ALTER SEQUENCE public.dim_bicicleta_sk_bicicleta_seq OWNED BY public.dim_bicicleta.sk_bicicleta;

CREATE TABLE public.ft_locacao_bike (
                sk_funcionario INTEGER NOT NULL,
                sk_bicicleta INTEGER NOT NULL,
                sk_filial INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                dd_hr_locacao TIME NOT NULL,
                md_tempo_locacao INTEGER NOT NULL,
                md_desconto REAL NOT NULL,
                md_valor_loacao REAL NOT NULL
);


ALTER TABLE public.ft_locacao_bike ADD CONSTRAINT dim_data_ft_locacao_bike_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_locacao_bike ADD CONSTRAINT dim_filial_ft_locacao_bike_fk
FOREIGN KEY (sk_filial)
REFERENCES public.dim_filial (sk_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_locacao_bike ADD CONSTRAINT dim_funcionario_ft_locacao_bike_fk
FOREIGN KEY (sk_funcionario)
REFERENCES public.dim_funcionario (sk_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_locacao_bike ADD CONSTRAINT dim_bicicleta_ft_locacao_bike_fk
FOREIGN KEY (sk_bicicleta)
REFERENCES public.dim_bicicleta (sk_bicicleta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
