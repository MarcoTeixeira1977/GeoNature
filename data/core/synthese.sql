SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

CREATE SCHEMA gn_synthese;

SET search_path = gn_synthese, pg_catalog;

SET default_with_oids = false;


CREATE TABLE bib_modules (
    id_module integer NOT NULL,
    name_module character varying(255) NOT NULL,
    desc_module text,
    entity_module_pk_field character varying(255),
    url_module character varying(255),
    target character varying(10),
    picto_module character varying(255),
    groupe_module character varying(50) NOT NULL,
    active boolean NOT NULL
);


CREATE TABLE synthese (
    id_synthese integer NOT NULL,
    id_module integer,
    entity_module_pk_value integer,
    id_organisme integer,
    id_nomenclature_typ_inf_geo integer DEFAULT 143,
    id_dataset integer,
    id_nomenclature_obs_meth integer DEFAULT 42,
    id_nomenclature_obs_technique integer DEFAULT 343,
    id_nomenclature_bio_status integer DEFAULT 30,
    id_nomenclature_life_stage integer DEFAULT 3,
    id_nomenclature_sexe integer DEFAULT 189,
    id_nomenclature_bio_condition integer DEFAULT 177,
    id_nomenclature_naturalness integer DEFAULT 181,
    cd_nom integer,
    insee character(5),
    altitude_min integer,
    altitude_max integer,
    the_geom_3857 public.geometry(Geometry,3857),
    the_geom_point public.geometry(Point,3857),
    the_geom_local public.geometry(Geometry,MYLOCALSRID),
    date_min date NOT NULL,
    date_max date NOT NULL,
    observers character varying(255),
    determiner character varying(255),
    total_number integer,
    comment text,
    sensitivity INTEGER NOT NULL,
    deleted boolean DEFAULT false,
    meta_create_date timestamp without time zone DEFAULT now(),
    meta_update_date timestamp without time zone DEFAULT now(),
    last_action character(1),
    CONSTRAINT enforce_dims_the_geom_3857 CHECK ((public.st_ndims(the_geom_3857) = 2)),
    CONSTRAINT enforce_dims_the_geom_local CHECK ((public.st_ndims(the_geom_local) = 2)),
    CONSTRAINT enforce_dims_the_geom_point CHECK ((public.st_ndims(the_geom_point) = 2)),
    CONSTRAINT enforce_geotype_the_geom_point CHECK (((public.geometrytype(the_geom_point) = 'POINT'::text) OR (the_geom_point IS NULL))),
    CONSTRAINT enforce_srid_the_geom_3857 CHECK ((public.st_srid(the_geom_3857) = 3857)),
    CONSTRAINT enforce_srid_the_geom_local CHECK ((public.st_srid(the_geom_local) = MYLOCALSRID)),
    CONSTRAINT enforce_srid_the_geom_point CHECK ((public.st_srid(the_geom_point) = 3857))
);
COMMENT ON TABLE synthese IS 'Table de synthèse destinée à recevoir les données de tous les protocoles. Pour consultation uniquement';
COMMENT ON COLUMN synthese.id_nomenclature_obs_meth IS 'Correspondance nomenclature INPN = methode_obs';
COMMENT ON COLUMN synthese.id_nomenclature_obs_technique IS 'Correspondance nomenclature INPN = technique_obs';
COMMENT ON COLUMN synthese.id_nomenclature_life_stage IS 'Correspondance nomenclature INPN = stade_vie';
COMMENT ON COLUMN synthese.id_nomenclature_bio_status IS 'Correspondance nomenclature INPN = statut_bio';
COMMENT ON COLUMN synthese.id_nomenclature_bio_condition IS 'Correspondance nomenclature INPN = etat_bio';
COMMENT ON COLUMN synthese.id_nomenclature_naturalness IS 'Correspondance nomenclature INPN = naturalite';

CREATE SEQUENCE synthese_id_synthese_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE synthese_id_synthese_seq OWNED BY synthese.id_synthese;
ALTER TABLE ONLY synthese ALTER COLUMN id_synthese SET DEFAULT nextval('synthese_id_synthese_seq'::regclass);


---------------
--PRIMARY KEY--
---------------

ALTER TABLE ONLY bib_modules ADD CONSTRAINT pk_bib_modules PRIMARY KEY (id_module);

ALTER TABLE ONLY synthese ADD CONSTRAINT pk_synthese PRIMARY KEY (id_synthese);


---------
--INDEX--
---------
CREATE INDEX fki_synthese_bib_proprietaires ON synthese USING btree (id_organisme);

CREATE INDEX fki_synthese_insee_fkey ON synthese USING btree (insee);

CREATE INDEX fki_synthese_bib_modules ON synthese USING btree (id_module);

CREATE INDEX i_synthese_cd_nom ON synthese USING btree (cd_nom);

CREATE INDEX i_synthese_date_min ON synthese USING btree (date_min DESC);

CREATE INDEX i_synthese_date_max ON synthese USING btree (date_max DESC);

CREATE INDEX i_synthese_id_dataset ON synthese USING btree (id_dataset);

CREATE INDEX index_gist_synthese_the_geom_local ON synthese USING gist (the_geom_local);

CREATE INDEX index_gist_synthese_the_geom_3857 ON synthese USING gist (the_geom_3857);

CREATE INDEX index_gist_synthese_the_geom_point ON synthese USING gist (the_geom_point);


---------------
--FOREIGN KEY--
---------------
ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_bib_organismes FOREIGN KEY (id_organisme) REFERENCES utilisateurs.bib_organismes(id_organisme) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_id_dataset FOREIGN KEY (id_dataset) REFERENCES gn_meta.t_datasets(id_dataset) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_id_module FOREIGN KEY (id_module) REFERENCES bib_modules(id_module) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_typ_inf_geo FOREIGN KEY (id_nomenclature_typ_inf_geo) REFERENCES ref_nomenclatures.t_nomenclatures(id_nomenclature) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_obs_meth FOREIGN KEY (id_nomenclature_obs_meth) REFERENCES ref_nomenclatures.t_nomenclatures(id_nomenclature) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_obs_technique FOREIGN KEY (id_nomenclature_obs_technique) REFERENCES ref_nomenclatures.t_nomenclatures(id_nomenclature) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_bio_status FOREIGN KEY (id_nomenclature_bio_status) REFERENCES ref_nomenclatures.t_nomenclatures(id_nomenclature) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_life_stage FOREIGN KEY (id_nomenclature_life_stage) REFERENCES ref_nomenclatures.t_nomenclatures(id_nomenclature) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_sexe FOREIGN KEY (id_nomenclature_sexe) REFERENCES ref_nomenclatures.t_nomenclatures(id_nomenclature) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_bio_condition FOREIGN KEY (id_nomenclature_bio_condition) REFERENCES ref_nomenclatures.t_nomenclatures(id_nomenclature) ON UPDATE CASCADE;

ALTER TABLE ONLY synthese
    ADD CONSTRAINT fk_synthese_naturalness FOREIGN KEY (id_nomenclature_naturalness) REFERENCES ref_nomenclatures.t_nomenclatures(id_nomenclature) ON UPDATE CASCADE;


--------
--DATA--
--------
INSERT INTO bib_modules (id_module, name_module, desc_module, entity_module_pk_field, url_module, target, picto_module, groupe_module, active) VALUES (0, 'API', 'Donnée externe non définie (insérée dans la synthese à partir du service REST de l''API sans entity_module_pk_value fourni)', NULL, NULL, NULL, NULL, 'NONE', false);