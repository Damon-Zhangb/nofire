package com.example.model.auto;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author astupidcoder
 * @since 2020-12-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("IFP")
public class Ifp extends Model {

    private static final long serialVersionUID = 1L;

    @TableId(value = "device_id", type = IdType.AUTO)
    private Integer deviceId;

    private String deviceName;

    private Integer alarmLevel;

    private String address;

    private String alarmType;

    private LocalDateTime alarmTime;

    private String identification = "n";


}
