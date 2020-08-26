package com.pleasetoilet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.pleasetoilet.vo.ReviewVO;

@Component
public class ReviewDAO {
	
	@Autowired
	private DataSource dataSource;
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	public void closeDB() {
		if(rs!=null) {
			try {
				rs.close();
			} catch(Exception e1) {
				e1.printStackTrace();
			} finally {
				rs=null;
			}
		}
		if(st!=null) {
			try {
				st.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			} finally {
				st=null;
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch(Exception e3) {
				e3.printStackTrace();
			} finally {
				conn=null;
			}
		}
	}

	public List<ReviewVO> getReview(String tno, String id){
		List<ReviewVO> list= new ArrayList<ReviewVO>();
		
		list.add(new ReviewVO(1, "gooood", "test1234", "to1", "20/01/01"));
		list.add(new ReviewVO(2, "baaaad", "qkqh123", "to1", "20/01/02"));
		list.add(new ReviewVO(3, "soso", "testbo", "to1", "20/01/03"));
		list.add(new ReviewVO(4, "dirty", "babo12", "to1", "20/01/04"));
//		try {
//			conn=dataSource.getConnection();			
//			String sql="select review.uno,contents,member.id,toilet.smallName,usedate from member, review, usetoilet, toilet where review.uno=usetoilet.uno and toilet.tno = usetoilet.tno and toilet.tno=? and member.mno=usetoilet.mno";
//			st=conn.prepareStatement(sql);
//			st.setString(1,tno);
//			rs=st.executeQuery();
//			while(rs.next()) {
//				list.add(new ReviewVO(rs.getInt("uno"), rs.getString("contents"), rs.getString("id"), rs.getString("smallName"), rs.getString("usedate")));
//			}
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		} finally {
//			closeDB();
//		}
		return list;
	}
}