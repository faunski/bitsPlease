/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import Resources.Validate;
import Util.HibernateStuff;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import model.Message;
import model.UserAccount;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Izymi
 */
@Stateless
@Path("model.useraccount")
public class UserAccountFacadeREST extends AbstractFacade<UserAccount> {

    private SessionFactory sessionFactory;
    private RestHelper restHelper;
    @PersistenceContext(unitName = "ProjectTestUDPU")
    private EntityManager em;

    public UserAccountFacadeREST() {
        super(UserAccount.class);
        this.restHelper = new RestHelper();
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(UserAccount entity) {
        this.sessionFactory = HibernateStuff.getInstance().getSessionFactory();
        Session session
                = sessionFactory.openSession();
        if (this.restHelper.checkEmail(entity)) {
            session.beginTransaction();
            session.saveOrUpdate(entity);
            session.getTransaction().commit();

        }

    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Long id, UserAccount entity) {
        this.sessionFactory = HibernateStuff.getInstance().getSessionFactory();
        Session session
                = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(entity);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {

        }

    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Long id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML})
    public UserAccount find(@PathParam("id") Long id) {
        this.sessionFactory = HibernateStuff.getInstance().getSessionFactory();
        Session session
                = sessionFactory.openSession();

        UserAccount userAccount
                = (UserAccount) session.get(UserAccount.class, id);

        return userAccount;
    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<UserAccount> findAll() {
        return this.restHelper.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<UserAccount> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }

    @POST
    @Path("userByEmail")
    @Consumes({MediaType.TEXT_PLAIN})
    @Produces(MediaType.APPLICATION_XML)
    public UserAccount getUser(String email) {
        UserAccount ua = restHelper.getUserByEmail(email);
        List<Message> messages = ua.getMessages();
        Collections.reverse(messages);
        ua.setMessages(messages);
        return ua;

    }

    @GET
    @Path("userByEmail")
    @Produces(MediaType.APPLICATION_XML)
    public UserAccount getUsertest() {

        return this.restHelper.getUserByEmail("admint@koppa");
    }

    @POST
    @Path("userByEmail")
    @Consumes(MediaType.APPLICATION_XML)
    public void userUD(UserAccount account) {
        this.sessionFactory = HibernateStuff.getInstance().getSessionFactory();
        Session session
                = sessionFactory.openSession();

        session.beginTransaction();
        session.update(account);
        session.getTransaction().commit();

    }

    @GET
    @Path("userPassCheck/{email}/{password}")

    @Produces(MediaType.TEXT_PLAIN)
    public boolean checkPassword(@PathParam("email") String email, @PathParam("password") String password) {
        Validate validate = new Validate();
        return validate.checkUser(email, password);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

}
