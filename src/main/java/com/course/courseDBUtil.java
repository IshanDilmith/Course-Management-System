package com.course;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class courseDBUtil {

	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet resSet = null;

	public static boolean insertCourse(String id, String name, String desc, double fee) {
		
		boolean isSuccess = false;
		
		try {
			
			conn = DBconnect.getConnection();
			stmt = conn.createStatement();
			
			String sql = "INSERT INTO Course values('"+id+"', '"+name+"', '"+desc+"', '"+fee+"')";
			
			int res = stmt.executeUpdate(sql);
			
			if(res>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<Course> viewCourse() {
		
		ArrayList<Course> courseList = new ArrayList<>();
		
		try {
			
			conn = DBconnect.getConnection();
			stmt = conn.createStatement();
			
			resSet = stmt.executeQuery("SELECT * FROM course");
			
			while(resSet.next()) {
				Course course = new Course(
						resSet.getString("Course_id"),
						resSet.getString("Course_Name"),
						resSet.getString("Course_Description"),
						resSet.getDouble("Course_Fee")
						);
				courseList.add(course);
			}
			
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return courseList;
	}
	
	public static boolean updateCourse(String id, String name, String desc, double fee) {
		
		boolean isSuccess = false;
		try {
			
			String sql = "UPDATE course SET Course_Name=?, Course_Description =?, Course_Fee=? WHERE Course_Id=?";
			
			conn = DBconnect.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, desc);
			pstmt.setDouble(3, fee);
			pstmt.setString(4, id);
			
			int res = pstmt.executeUpdate();
			
			if(res>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
				
		
		} catch(Exception e){
				e.printStackTrace();
		}
		
		return isSuccess;
	}

	public static boolean deleteCourse(String id) {
		
		boolean isSuccess = false;
		
		try {
			String sql = "DELETE FROM course WHERE Course_Id=?";
			
			conn = DBconnect.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			int res = pstmt.executeUpdate();
			
			if(res>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
}
