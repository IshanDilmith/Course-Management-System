package com.course;

public class Course {
	private String courseId;
	private String courseName;
	private String courseDes;
	private double cFee;
	
	public Course(String courseId, String courseName, String courseDes, double cFee) {
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseDes = courseDes;
		this.cFee = cFee;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseDes() {
		return courseDes;
	}

	public void setCourseDes(String courseDes) {
		this.courseDes = courseDes;
	}

	public double getcFee() {
		return cFee;
	}

	public void setcFee(double cFee) {
		this.cFee = cFee;
	}
	
}
