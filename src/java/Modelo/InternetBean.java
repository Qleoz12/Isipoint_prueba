/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author LLancheros
 */
@Entity
@Table(name = "internet")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "InternetBean.findAll", query = "SELECT i FROM InternetBean i"),
    @NamedQuery(name = "InternetBean.findById", query = "SELECT i FROM InternetBean i WHERE i.id = :id"),
    @NamedQuery(name = "InternetBean.findByDescripcion", query = "SELECT i FROM InternetBean i WHERE i.descripcion = :descripcion")})
public class InternetBean implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;

    public InternetBean() {
    }

    public InternetBean(Integer id) {
        this.id = id;
    }

    public InternetBean(Integer id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InternetBean)) {
            return false;
        }
        InternetBean other = (InternetBean) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.InternetBean[ id=" + id + " ]";
    }
    
}
