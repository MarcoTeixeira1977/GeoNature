import { Component, Input, OnInit, OnDestroy } from '@angular/core';
import { FormGroup, FormArray } from '@angular/forms';
import { Subscription } from 'rxjs/Subscription';
import { MapService } from '../../map/map.service';
import { DataFormService } from '../data-form.service';
import {NgbDateStruct} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'pnx-observation',
  templateUrl: 'observation.component.html',
  styleUrls: ['./observation.component.scss']
})

export class ObservationComponent implements OnInit, OnDestroy {
  @Input() releveForm: FormGroup;
  public dateMin: any;
  public dateMax: any;
  public bsRangeValue: any = [new Date(2017, 7, 4), new Date(2017, 7, 20)];
  public geojson: any;
  public dataSets: any;
  public geoInfo: any;
  public municipalities: string;
  private geojsonSubscription$: Subscription;

  constructor(private _ms: MapService, private _dfs: DataFormService) {  }

  ngOnInit() {
    // load datasets
    this._dfs.getDatasets()
    .subscribe(res => this.dataSets = res);
    // provisoire:
    this.dataSets = [1, 2, 3];

    // subscription to the geojson observable
    this.geojsonSubscription$ = this._ms.gettingGeojson$
    .subscribe(geojson => {
        this.releveForm.patchValue({geometry: geojson});
        this.geojson = geojson;
        // subscribe to geo info
        this._dfs.getGeoInfo(geojson)
          .subscribe(res => {
            this.releveForm.controls.properties.patchValue({
              altitude_min: res.altitude[0].altitude_min,
              altitude_max: res.altitude[0].altitude_max,
              id_municipality : res.municipality.map(m => m.code)
            });
            this.municipalities = res.municipality.map(m => m.name).join();
          });
      });
      //this.releveForm.controls.properties.controls.date_max.
  }

  ngOnDestroy() {
    this.geojsonSubscription$.unsubscribe();
  }
}