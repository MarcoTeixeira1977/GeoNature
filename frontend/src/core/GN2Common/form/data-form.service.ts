import { Injectable } from '@angular/core';
import { Http, URLSearchParams } from '@angular/http';
import 'rxjs/add/operator/toPromise';
import { AppConfigs } from '../../../conf/app.configs';

@Injectable()
export class DataFormService {

  constructor(private _http: Http) {
   }

  getNomenclature(id_nomenclature: number, regne?: string, group2_inpn?: string) {
    const params: URLSearchParams = new URLSearchParams();
    regne ? params.set('regne', regne) : params.set('regne', '');
    group2_inpn ? params.set('group2_inpn', group2_inpn) : params.set('group2_inpn', '');
    return this._http.get(`${AppConfigs.API_ENDPOINT}nomenclatures/nomenclature/${id_nomenclature}`, {search: params})
    .map(response => response.json());
    }

  getDatasets() {
    return this._http.get(`${AppConfigs.API_ENDPOINT}meta/datasets`)
      .map(response => response.json());
  }

  getObservers(idMenu) {
     return this._http.get(`${AppConfigs.API_ENDPOINT}users/menu/${idMenu}`)
      .map(response => response.json());
  }

  searchTaxonomy (taxonName: string, id: string) {
    return this._http.get(`${AppConfigs.API_TAXHUB}taxref/allnamebylist/${id}?search_name=${taxonName}`)
    .map(res => res.json());
  }

  getGeoInfo(geojson) {
    return this._http.post(`${AppConfigs.API_ENDPOINT}geo/info`, geojson)
      .map(response => response.json());
  }

}