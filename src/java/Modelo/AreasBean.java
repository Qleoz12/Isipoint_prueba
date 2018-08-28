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
@Table(name = "Areas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AreasBean.findAll", query = "SELECT a FROM AreasBean a"),
    @NamedQuery(name = "AreasBean.findById", query = "SELECT a FROM AreasBean a WHERE a.id = :id"),
    @NamedQuery(name = "AreasBean.findByDescripcion", query = "SELECT a FROM AreasBean a WHERE a.descripcion = :descripcion")})
public class AreasBean implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;

    public AreasBean() {
    }

    public AreasBean(Integer id) {
        this.id = id;
    }

    public AreasBean(Integer id, String descripcion) {
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
        if (!(object instanceof AreasBean)) {
            return false;
        }
        AreasBean other = (AreasBean) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.AreasBean[ id=" + id + " ]";
    }
    
}
