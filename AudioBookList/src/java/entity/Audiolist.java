package entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "audiolist")
public class Audiolist implements Serializable {
    private static final long serialVersionUID = 1L;
    
    public Audiolist() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="person_id")
    private Person person;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="audiobook_id")
    private Audiobook audiobook;

    @Column(name="rating")
    private long rating;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Audiobook getAudiobook() {
        return audiobook;
    }

    public void setAudiobook(Audiobook audiobook) {
        this.audiobook = audiobook;
    }

    public long getRating() {
        return rating;
    }

    public void setRating(long rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Audiolist{" + "id=" + id + ", person=" + person + ", audiobook=" + audiobook + ", rating=" + rating + '}';
    }
    
}
