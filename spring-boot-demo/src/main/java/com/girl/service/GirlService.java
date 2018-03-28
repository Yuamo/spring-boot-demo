package com.girl.service;

import com.girl.enums.ResultEnum;
import com.girl.exception.GirlException;
import com.girl.repository.GirlRepository;
import com.girl.domain.Girl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017/8/17.
 */
@Service
public class GirlService {

    @Autowired
    private GirlRepository girlRepository;

    @Transactional
    public void insertTwo() {
        Girl girlA = new Girl();
        girlA.setCupSize("B");
        girlA.setAge(2);
        girlRepository.save(girlA);

        Girl girlB = new Girl();
        girlB.setCupSize("B");
        girlB.setAge(262212122);
        girlRepository.save(girlB);
    }

    @Transactional
    public List<Girl> ageSelect() {
        return null;
    }

    public Girl getAge(Integer id) throws Exception {
        Girl girl = girlRepository.findOne(id);
        if (girl == null) {
            throw new GirlException(ResultEnum.NO_DATA);
        }
        Integer age = girl.getAge();
        if (age < 10) {
            // System.out.println("还在上小学");
            throw new GirlException(ResultEnum.PRIMARY_SCHOOL);
        } else if (age > 10 && age < 16) {
            //  System.out.println("还在上初中");
            throw new GirlException(ResultEnum.MIDDLE_SCHOOL);
        }
        return girl;
    }
}
