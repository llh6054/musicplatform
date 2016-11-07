package com.design.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/Test")
public class TestController extends ConfigController{
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	
//	Session session = getHibernateTemplate().getSessionFactory()
//			   .getCurrentSession();
//			   StringBuffer sb = new StringBuffer(" select user.username,user.truename,user.sex,user.idnum,user.level,s.sumScore from Score as s,Examuser as user where s.id.userId = user.id ");
//			   if(score != null){
//			    if(score.getExamId()!=null && !"".equals(score.getExamId())
//			      && !"null".equals(score.getExamId())){
//			     sb.append(" and s.examId =:examId ");
//			    }
//			    if(score.getExamPlace()!=null && !"".equals(score.getExamPlace())
//			      && !"null".equals(score.getExamPlace())){
//			     sb.append(" and s.examPlace =:examPlace ");
//			    }
//			    if(score.getUsername()!=null && !"".equals(score.getUsername())
//			      && !"null".equals(score.getUsername())){
//			     sb.append(" and s.username like:username ");
//			    }
//			   }
//			   sb.append(" order by s.sumScore desc ");
//			   Query q = session.createQuery(sb.toString());
//			   if(score != null){
//			    if(score.getExamId()!=null && !"".equals(score.getExamId())
//			      && !"null".equals(score.getExamId())){
//			     q.setParameter("examId",score.getExamId());
//			    }
//			    if(score.getExamPlace()!=null && !"".equals(score.getExamPlace())
//			      && !"null".equals(score.getExamPlace())){
//			     q.setParameter("examPlace",score.getExamPlace());
//			    }
//			    if(score.getUsername()!=null && !"".equals(score.getUsername())
//			      && !"null".equals(score.getUsername())){
//			     q.setParameter("username","%"+score.getUsername()+"%");
//			    }
//			   }
//			   List list = q.list();
//			   
//			   
//			   ist stuList = scoreService.findAllScore(queryScore, null); // 返回的结果集
//			   if(stuList != null && stuList.size()>0){
//			    list = new LinkedList();
//			    StudentScore st;
//			    for(int i = 0; i < stuList.size();i++){
//			     st = new StudentScore();
//			     Object[] object = (Object[])stuList.get(i);// 每行记录不在是一个对象 而是一个数组
//			     String userId =  (String)object[0];
//			     String username =  (String)object[1];
//			     String truename =  (String)object[2];
//			     String sex =  (String)object[3];
//			     String idnum =  (String)object[4];
//			     String level =  (String)object[5];
//			     Double sumScore =  Double.parseDouble(String.valueOf(object[6]));
//			     String paperId =  (String)object[7];
//			     // 重新封装在一个javabean里面
//			     st.setUserId(userId);
//			     st.setUsername(username);
//			     st.setTruename(truename);
//			     st.setIdnum(idnum);
//			     st.setLevel(DictSwitch.getValue("DICT_LEVEL",level));
//			     st.setSex(DictSwitch.getValue("DICT_SEX",sex));
//			     st.setPaperId(paperId);
//			     st.setSumScore(sumScore);
//			     st.setExamplace(DictSwitch.getValue("DICT_EXAMSTATION",examplace));
//			     list.add(st); // 最终封装在list中 传到前台。
//			    }
}
