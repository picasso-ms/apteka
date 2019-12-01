package dao.userDao;

import entity.User;

public interface UserDao {

    public User getUserByLogin(String login);
    public void addUserToDb(User u);
}
