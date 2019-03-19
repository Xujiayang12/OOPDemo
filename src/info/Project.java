package info;

import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

public class Project {
    private int id;
    private String name, classroom, detail, member, link, eval, teacher_eval,document;

    public int getId() {
        return id;
    }

    public void setDocument(String document) {
        this.document = document;
    }

    public String getDocument() {
        return TextEdit.de_coder(document);
    }

    public String getName() {
        return TextEdit.de_coder(name);
    }

    public String getClassroom() {
        return TextEdit.de_coder(classroom);
    }

    public String getDetail() {
        return TextEdit.de_coder(detail);
    }

    public String getMember() {
        return TextEdit.de_coder(member);
    }

    public String getLink() {
        return TextEdit.de_coder(link);
    }

    public String getEval() {
        return TextEdit.de_coder(eval);
    }

    public String getTeacher_eval() {
        return TextEdit.de_coder(teacher_eval);
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void setMember(String member) {
        this.member = member;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setEval(String eval) {
        this.eval = eval;
    }

    public void setTeacher_eval(String teacher_eval) {
        this.teacher_eval = teacher_eval;
    }

    public static Project findById(int id) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            List<Project> projectList = sqlSession.selectList("Project.findById", id);
            return projectList.get(0);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static List<Project> getAllProject(){
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            List<Project> projectList = sqlSession.selectList("Project.findAll");
            return projectList;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static Project findByClass(String classroom) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            List<Project> projectList = sqlSession.selectList("Project.findByClass", classroom);
            return projectList.get(0);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static boolean setProject(String name,String classroom,String detail,String link,String document)
    {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            Project new_project = new Project();
            new_project.setClassroom(classroom);
            new_project.setDetail(detail);
            new_project.setLink(link);
            new_project.setName(name);
            new_project.setDocument(document);
            sqlSession.insert("Project.setProject",new_project);
            sqlSession.commit();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
//                return false;
            }
        }
    }

    public static boolean updateProject(int id,String name,String classroom,String detail,String document,String link)
    {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            Project old_project = new Project();
            old_project.setId(id);
            old_project.setClassroom(classroom);
            old_project.setDetail(detail);
            old_project.setLink(link);
            old_project.setName(name);
            old_project.setDocument(document);
            sqlSession = dbAccess.getSqlsession();
            sqlSession.update("Project.updateById",old_project);
            sqlSession.commit();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }
    public static void preset(String name,String classroom,String detail,String link,String document)
    {
        setProject(name,classroom,detail,link,document);
    }

    public static void main(String args[]) {
//        preset("xxcaocai系统","软工1班","111","http://111.com","#xxx");
        for(Project p:Project.getAllProject())
        {
            System.out.println(p.getName()+p.getId());
        }
//        System.out.println(findByClass("软工1班").getName());
    }
}
