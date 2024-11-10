package com.course;
import java.util.List;

public class retrieveCoursesServlet {
	public List<Course> getAllCourses() {
        return courseDBUtil.viewCourse();
    }
}
