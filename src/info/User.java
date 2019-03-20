package info;

import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

public class User {
    private String account, name, password, classroom, qq, phone;
    private int id, admin, project,self_score,teacher_score;

    public String getAccount() {
        return account;
    }

    public String getName() {
        return TextEdit.de_coder(name);
    }

    public String getPassword() {
        return password;
    }

    public String getClassroom() {
        return TextEdit.de_coder(classroom);
    }

    public String getClassroom(int i) {
        return classroom;
    }

    public String getQq() {
        return qq;
    }

    public String getPhone() {
        return phone;
    }

    public int getId() {
        return id;
    }

    public int getAdmin() {
        return admin;
    }

    public int getProject() {
        return project;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public void setProject(int project) {
        this.project = project;
    }

    public int getSelf_score() {
        return self_score;
    }

    public void setSelf_score(int self_score) {
        this.self_score = self_score;
    }

    public int getTeacher_score() {
        return teacher_score;
    }

    public void setTeacher_score(int teacher_score) {
        this.teacher_score = teacher_score;
    }

    public void setAllWhenSignUp(String account, String name, String password, String classroom, String qq, String phone) {
        this.account = account;
        this.name = name;
        this.password = password;
        this.classroom = classroom;
        this.qq = qq;
        this.phone = phone;
    }

    public String getProjectName() {
        return getProjectNameById(this.project);
    }

    public static User findById(int id) {//通过Id寻找用户 返回User类
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            List<User> Userlist = sqlSession.selectList("User.findById", id);
            return Userlist.get(0);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static User findByAccount(String account) {//通过account寻找用户，返回User类
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            List<User> Userlist = sqlSession.selectList("User.findByAccount", account);
            return Userlist.get(0);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static List<User> findAllByClass(String classroom) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            List<User> Userlist = sqlSession.selectList("User.findByClass", classroom);
            return Userlist;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static List<User> findAllByProject(int project) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            List<User> Userlist = sqlSession.selectList("User.findByProject", project);
            return Userlist;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static List<User> findAll() {//列出所有用户，返回User集合
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            List<User> Userlist = sqlSession.selectList("User.findAll");
//            for(User u:Userlist){
//                System.out.println(u);
//            }
            return Userlist;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static User getAllInfo(String account, String password) {//可直接调用的方法，获取信息 返回User
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        User result = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            User u = new User();
            u.setAccount(account);
            u.setPassword(password);
            List<User> Userlist = sqlSession.selectList("User.loginCheck", u);
            return Userlist.get(0);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return result;
    }


    public static boolean signUp(String account, String name, String password, String classroom, String qq, String phone) {
        DBAccess dbAccess = new DBAccess();//注册
        SqlSession sqlSession = null;
        try {
            if (isAccountExist(account)) return false;
            else {
                sqlSession = dbAccess.getSqlsession();
                User u = new User();
                u.setAllWhenSignUp(account, name, password, classroom, qq, phone);
                sqlSession.insert("User.signUp", u);
                sqlSession.commit();
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static boolean adminAdd(String account, String name, String password, String classroom, String qq, String phone, String admin) {
        DBAccess dbAccess = new DBAccess();//管理员增加
        SqlSession sqlSession = null;
        try {
            if (isAccountExist(account)) return false;
            else {
                sqlSession = dbAccess.getSqlsession();
                User u = new User();
                u.setAllWhenSignUp(account, name, password, classroom, qq, phone);
                u.setAdmin(Integer.parseInt(admin));
                sqlSession.insert("User.adminAdd", u);
                sqlSession.commit();
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static boolean isAccountExist(String account) {
        DBAccess dbAccess = new DBAccess();//检测帐号是否存在
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            User u = new User();
            u.setAccount(account);
            List<User> Userlist = sqlSession.selectList("User.isAccountExist", u);
            if (Userlist.size() >= 1)
                return true;
            else return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static boolean loginCheck(String account, String password) {//可直接调用的方法，判断是否密码错误
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            User u = new User();
            u.setAccount(account);
            u.setPassword(password);
            List<User> Userlist = sqlSession.selectList("User.loginCheck", u);
            if (Userlist.size() == 1)
                return true;
            else return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static void deleteById(int id) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            sqlSession.delete("User.deleteById", id);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static void deleteById(String id) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            int id_num = Integer.parseInt(id);
            sqlSession.delete("User.deleteById", id_num);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static void updateById(User u) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlsession();
            sqlSession.update("User.updateById", u);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static void setSelfScore(int id,int self_score) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            User u = new User();
            u.setId(id);
            u.setSelf_score(self_score);
            sqlSession = dbAccess.getSqlsession();
            sqlSession.update("User.setSelfScore", u);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static void setTeacherScore(int id,int score) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            User u = new User();
            u.setId(id);
            u.setTeacher_score(score);
            sqlSession = dbAccess.getSqlsession();
            sqlSession.update("User.setTeacherScore", u);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static String getProjectNameById(int id) {
        if (id == 0) return "无";
        else {
            Project a_p = Project.findById(id);
            return a_p.getName();
        }
    }

    public static void updateHisProject(int id,int pid){
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            User u = new User();
            u.setId(id);
            u.setProject(pid);
            sqlSession = dbAccess.getSqlsession();
            sqlSession.update("User.updateProject", u);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public static void main(String args[]) {
        updateHisProject(4,6);
    }
}
