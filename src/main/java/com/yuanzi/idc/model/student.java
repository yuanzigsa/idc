package com.yuanzi.idc.model;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;

@Erupt(name = "学生列表")
@Table(name = "student_Man")
@Entity
public class student extends BaseModel {

        @EruptField(
                views = @View(
                        title = "姓名"
                ),
                edit = @Edit(
                        title = "姓名",
                        type = EditType.INPUT, search = @Search, notNull = true,
                        inputType = @InputType
                )
        )
        private String name;

        @EruptField(
                views = @View(
                        title = "状态"
                ),
                edit = @Edit(
                        title = "状态",
                        type = EditType.BOOLEAN, search = @Search, notNull = true,
                        boolType = @BoolType
                )
        )
        private Boolean zhuangtai;

}