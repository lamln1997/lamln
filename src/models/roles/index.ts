import {
    AllowNull,
    AutoIncrement, Column, CreatedAt, DataType, HasMany, Length,
    Model, PrimaryKey,
    Table, Unique, UpdatedAt
} from "sequelize-typescript";
import {
    UserRole,
    RolePermission
} from '..'
@Table({
    tableName: 'roles',
    indexes: [
        {
            fields: ['id']
        }
    ]
})

export class RoleModel extends Model<RoleModel> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number

    @Unique
    @Length({max: 255})
    @AllowNull(false)
    @Column
    name: string

    @Length({max: 255})
    @AllowNull(true)
    @Column
    description: string;

    @CreatedAt
    @Column(DataType.DATE)
    created_at!: Date;

    @UpdatedAt
    @Column(DataType.DATE)
    updated_at!: Date;

    //constraints: bo qua cac rang buoc giua cac model
    @HasMany(() => UserRole, {constraints: false})
    users: UserRole[]

    @HasMany(() => RolePermission, {constraints: false})
    permissions: RolePermission[]
}