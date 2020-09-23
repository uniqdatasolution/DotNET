export class LoginModel {
    UserName?: string;
    Password?: string;
}

export class ReferenceDataEntity {
    Id: number;
    EntityName?: string;
    EntityDisplayValue?: string;
}
export class ReferenceDataEntityValue {
    Id: number;
    EntityId?: number;
    EntitValue?: string;
    EntityDisplayValue?: string;
}