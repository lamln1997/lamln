import {
    AllowNull,
    AutoIncrement,
    Column,
    CreatedAt,
    Model,
    PrimaryKey,
    Table,
    UpdatedAt,
    Unique, DataType, Length, Validate, HasMany, BelongsToMany
} from "sequelize-typescript";
import {
    RoleModel,
    UserRole
} from '..'
@Table({
    tableName: "user",
    indexes: [
        {
            fields: ["id"]
        }
    ]
})

export class UserModel extends Model<UserModel> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number

    @Unique
    @AllowNull(false)
    @Length({msg: 'Số điện thoại từ 10 đến 15 ký tự', min: 10, max: 15})
    @Column
    phone: string

    @Unique
    // co the null hay khong
    @AllowNull(false)
    @Column
    email: string

    @AllowNull(false)
    @Length({min: 6, max: 255})
    @Column
    password: string

    @AllowNull(false)
    @Column(DataType.STRING(255))
        // tslint:disable-next-line:variable-name
    first_name: string

    @AllowNull(false)
    @Column(DataType.STRING(255))
        // tslint:disable-next-line:variable-name
    last_name: string

    @AllowNull(true)
    @Column
    age: number

    @AllowNull(true)
    @Column(DataType.STRING(255))
    address: string

    @CreatedAt
    @Column(DataType.DATE)
        // tslint:disable-next-line:variable-name
    created_at!: Date;

    @UpdatedAt
    @Column(DataType.DATE)
        // tslint:disable-next-line:variable-name
    updated_at!: Date;

    // constraints: bo qua cac rang buoc giua cac model
    // @HasMany(() => UserRole, {constraints: false})
    // roles: UserRole[]
    @BelongsToMany(() => RoleModel, () => UserRole)
    roles: RoleModel[]
    toJSON(): object {
        const obj: any = super.toJSON();
        delete obj.password;
        return obj;
    }
}
