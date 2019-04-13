package com.u2.other;

import java.util.List;

import com.u2.model.Seed;
import com.u2.util.DateUtil;
import com.u2.web.SeedAction;

public class LessonAction extends SeedAction{

	@Override
	public void beforeAdd(List<Seed> seeds) {
		// TODO Auto-generated method stub
		seeds.add(new Seed("createTime", DateUtil.getCurrentDate("yyyy-MM-dd")));
	}
}
