<?php

/**
 * BaseLCommunes
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $insee
 * @property integer $id_secteur
 * @property string $commune_maj
 * @property string $departement
 * @property string $commune_min
 * @property string $epci
 * @property string $coeur_aoa
 * @property integer $codenum
 * @property string $pays
 * @property boolean $saisie_fv
 * @property boolean $saisie_fp
 * @property boolean $pn
 * @property boolean $atlas
 * @property boolean $leader2
 * @property boolean $leaderplus
 * @property integer $id_secteur_fp
 * @property blob $the_geom
 * @property LSecteurs $LSecteurs
 * @property Doctrine_Collection $Syntheseff
 * @property Doctrine_Collection $TFichesCf
 * @property Doctrine_Collection $TFichesCflore
 * @property Doctrine_Collection $TFichesInv
 * @property Doctrine_Collection $TStationsBryo
 * @property Doctrine_Collection $TStationsFs
 * 
 * @method string              get()              Returns the current record's "insee" value
 * @method integer             get()              Returns the current record's "id_secteur" value
 * @method string              get()              Returns the current record's "commune_maj" value
 * @method string              get()              Returns the current record's "departement" value
 * @method string              get()              Returns the current record's "commune_min" value
 * @method string              get()              Returns the current record's "epci" value
 * @method string              get()              Returns the current record's "coeur_aoa" value
 * @method integer             get()              Returns the current record's "codenum" value
 * @method string              get()              Returns the current record's "pays" value
 * @method boolean             get()              Returns the current record's "saisie_fv" value
 * @method boolean             get()              Returns the current record's "saisie_fp" value
 * @method boolean             get()              Returns the current record's "pn" value
 * @method boolean             get()              Returns the current record's "atlas" value
 * @method boolean             get()              Returns the current record's "leader2" value
 * @method boolean             get()              Returns the current record's "leaderplus" value
 * @method integer             get()              Returns the current record's "id_secteur_fp" value
 * @method blob                get()              Returns the current record's "the_geom" value
 * @method LSecteurs           get()              Returns the current record's "LSecteurs" value
 * @method Doctrine_Collection get()              Returns the current record's "Syntheseff" collection
 * @method Doctrine_Collection get()              Returns the current record's "TFichesCf" collection
 * @method Doctrine_Collection get()              Returns the current record's "TFichesCflore" collection
 * @method Doctrine_Collection get()              Returns the current record's "TFichesInv" collection
 * @method Doctrine_Collection get()              Returns the current record's "TStationsBryo" collection
 * @method Doctrine_Collection get()              Returns the current record's "TStationsFs" collection
 * @method LCommunes           set()              Sets the current record's "insee" value
 * @method LCommunes           set()              Sets the current record's "id_secteur" value
 * @method LCommunes           set()              Sets the current record's "commune_maj" value
 * @method LCommunes           set()              Sets the current record's "departement" value
 * @method LCommunes           set()              Sets the current record's "commune_min" value
 * @method LCommunes           set()              Sets the current record's "epci" value
 * @method LCommunes           set()              Sets the current record's "coeur_aoa" value
 * @method LCommunes           set()              Sets the current record's "codenum" value
 * @method LCommunes           set()              Sets the current record's "pays" value
 * @method LCommunes           set()              Sets the current record's "saisie_fv" value
 * @method LCommunes           set()              Sets the current record's "saisie_fp" value
 * @method LCommunes           set()              Sets the current record's "pn" value
 * @method LCommunes           set()              Sets the current record's "atlas" value
 * @method LCommunes           set()              Sets the current record's "leader2" value
 * @method LCommunes           set()              Sets the current record's "leaderplus" value
 * @method LCommunes           set()              Sets the current record's "id_secteur_fp" value
 * @method LCommunes           set()              Sets the current record's "the_geom" value
 * @method LCommunes           set()              Sets the current record's "LSecteurs" value
 * @method LCommunes           set()              Sets the current record's "Syntheseff" collection
 * @method LCommunes           set()              Sets the current record's "TFichesCf" collection
 * @method LCommunes           set()              Sets the current record's "TFichesCflore" collection
 * @method LCommunes           set()              Sets the current record's "TFichesInv" collection
 * @method LCommunes           set()              Sets the current record's "TStationsBryo" collection
 * @method LCommunes           set()              Sets the current record's "TStationsFs" collection
 * 
 * @package    geonature
 * @subpackage model
 * @author     Gil Deluermoz
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseLCommunes extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('layers.l_communes');
        $this->hasColumn('insee', 'string', 5, array(
             'type' => 'string',
             'primary' => true,
             'length' => 5,
             ));
        $this->hasColumn('id_secteur', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             ));
        $this->hasColumn('commune_maj', 'string', 40, array(
             'type' => 'string',
             'length' => 40,
             ));
        $this->hasColumn('departement', 'string', 2, array(
             'type' => 'string',
             'length' => 2,
             ));
        $this->hasColumn('commune_min', 'string', 40, array(
             'type' => 'string',
             'length' => 40,
             ));
        $this->hasColumn('epci', 'string', 40, array(
             'type' => 'string',
             'length' => 40,
             ));
        $this->hasColumn('coeur_aoa', 'string', 2, array(
             'type' => 'string',
             'length' => 2,
             ));
        $this->hasColumn('codenum', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             ));
        $this->hasColumn('pays', 'string', 40, array(
             'type' => 'string',
             'length' => 40,
             ));
        $this->hasColumn('saisie_fv', 'boolean', 1, array(
             'type' => 'boolean',
             'length' => 1,
             ));
        $this->hasColumn('saisie_fp', 'boolean', 1, array(
             'type' => 'boolean',
             'length' => 1,
             ));
        $this->hasColumn('pn', 'boolean', 1, array(
             'type' => 'boolean',
             'length' => 1,
             ));
        $this->hasColumn('atlas', 'boolean', 1, array(
             'type' => 'boolean',
             'length' => 1,
             ));
        $this->hasColumn('leader2', 'boolean', 1, array(
             'type' => 'boolean',
             'length' => 1,
             ));
        $this->hasColumn('leaderplus', 'boolean', 1, array(
             'type' => 'boolean',
             'length' => 1,
             ));
        $this->hasColumn('id_secteur_fp', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             ));
        $this->hasColumn('the_geom', 'blob', null, array(
             'type' => 'blob',
             'length' => '',
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('LSecteurs', array(
             'local' => 'id_secteur',
             'foreign' => 'id_secteur'));

        $this->hasMany('Syntheseff', array(
             'local' => 'insee',
             'foreign' => 'insee'));

        $this->hasMany('TFichesCf', array(
             'local' => 'insee',
             'foreign' => 'insee'));

        $this->hasMany('TFichesCflore', array(
             'local' => 'insee',
             'foreign' => 'insee'));

        $this->hasMany('TFichesInv', array(
             'local' => 'insee',
             'foreign' => 'insee'));

        $this->hasMany('TStationsBryo', array(
             'local' => 'insee',
             'foreign' => 'insee'));

        $this->hasMany('TStationsFs', array(
             'local' => 'insee',
             'foreign' => 'insee'));
    }
}