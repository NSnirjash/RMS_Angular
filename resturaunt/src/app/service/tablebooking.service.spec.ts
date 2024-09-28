import { TestBed } from '@angular/core/testing';

import { TablebookingService } from './tablebooking.service';

describe('TablebookingService', () => {
  let service: TablebookingService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TablebookingService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
