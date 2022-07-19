-- DATABASE REPLICATION PROJECT BY PRANJAL DHAKAL, MARY GOCKENBACH, PRERANA KHATIWADA, DILEEP NIMMA, 
--                                 BIVEK POKHREL, ELISHA SHRESTHA, GRESHMA VACHEPALLI, HARITHA VARKALA 

--create database link
CREATE DATABASE LINK CTOD CONNECT TO C##_63710_GROUP_D IDENTIFIED BY C##_63710_GROUP_D USING 'CTOD';

-- Create triggers 
CREATE OR REPLACE TRIGGER trg_in_up_del_zipcode AFTER
    INSERT OR UPDATE OR DELETE ON zipcode
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO c##_63710_group_d.zipcode (
            zip,
            city,
            state,
            created_by,
            created_date,
            modified_by,
            modified_date
        ) VALUES (
            :new.zip,
            :new.city,
            :new.state,
            :new.created_by,
            :new.created_date,
            :new.modified_by,
            :new.modified_date
        );

    ELSIF "UPDATING" THEN
        UPDATE c##_63710_group_d.zipcode
        SET
            city = :new.city,
            created_by = :new.created_by,
            created_date = :new.created_date,
            modified_by = :new.modified_by,
            modified_date = :new.modified_date,
            state = :new.state
        WHERE
            zip = :new.zip;

    ELSIF deleting THEN
        DELETE FROM c##_63710_group_d.zipcode
        WHERE
            zip = :old.zip;

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_in_up_del_course AFTER
    INSERT OR UPDATE OR DELETE ON course
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO c##_63710_group_d.course (
            course_no,
            description,
            cost,
            prerequisite,
            created_by,
            created_date,
            modified_by,
            modified_date
        ) VALUES (
            :new.course_no,
            :new.description,
            :new.cost,
            :new.prerequisite,
            :new.created_by,
            :new.created_date,
            :new.modified_by,
            :new.modified_date
        );

    ELSIF "UPDATING" THEN
        UPDATE c##_63710_group_d.course
        SET
            cost = :new.cost,
            created_by = :new.created_by,
            created_date = :new.created_date,
            description = :new.description,
            modified_by = :new.modified_by,
            modified_date = :new.modified_date,
            prerequisite = :new.prerequisite
        WHERE
            course_no = :new.course_no;

    ELSIF deleting THEN
        DELETE FROM c##_63710_group_d.course
        WHERE
            course_no = :old.course_no;

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_in_up_del_enrollment AFTER
    INSERT OR UPDATE OR DELETE ON enrollment
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO c##_63710_group_d.enrollment (
            student_id,
            section_id,
            enroll_date,
            final_grade,
            created_by,
            created_date,
            modified_by,
            modified_date
        ) VALUES (
            :new.student_id,
            :new.section_id,
            :new.enroll_date,
            :new.final_grade,
            :new.created_by,
            :new.created_date,
            :new.modified_by,
            :new.modified_date
        );

    ELSIF "UPDATING" THEN
        UPDATE c##_63710_group_d.enrollment
        SET
            created_by = :new.created_by,
            created_date = :new.created_date,
            enroll_date = :new.enroll_date,
            final_grade = :new.final_grade,
            modified_by = :new.modified_by,
            modified_date = :new.modified_date
        WHERE
                student_id = :new.student_id
            AND section_id = :new.section_id;

    ELSIF deleting THEN
        DELETE FROM c##_63710_group_d.enrollment
        WHERE
                student_id = :old.student_id
            AND section_id = :old.section_id;

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_in_up_del_section AFTER
    INSERT OR UPDATE OR DELETE ON section
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO c##_63710_group_d.section (
            section_id,
            course_no,
            section_no,
            start_date_time,
            location,
            instructor_id,
            capacity,
            created_by,
            created_date,
            modified_by,
            modified_date
        ) VALUES (
            :new.section_id,
            :new.course_no,
            :new.section_no,
            :new.start_date_time,
            :new.location,
            :new.instructor_id,
            :new.capacity,
            :new.created_by,
            :new.created_date,
            :new.modified_by,
            :new.modified_date
        );

    ELSIF "UPDATING" THEN
        UPDATE c##_63710_group_d.section
        SET
            capacity = :new.capacity,
            course_no = :new.course_no,
            created_by = :new.created_by,
            created_date = :new.created_date,
            instructor_id = :new.instructor_id,
            location = :new.location,
            modified_by = :new.modified_by,
            modified_date = :new.modified_date,
            section_no = :new.section_no,
            start_date_time = :new.start_date_time
        WHERE
            section_id = :new.section_id;

    ELSIF deleting THEN
        DELETE FROM c##_63710_group_d.section
        WHERE
            section_id = :old.section_id;

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_in_up_del_student AFTER
    INSERT OR UPDATE OR DELETE ON student
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO c##_63710_group_d.student (
            student_id,
            salutation,
            first_name,
            last_name,
            street_address,
            zip,
            phone,
            employer,
            registration_date,
            created_by,
            created_date,
            modified_by,
            modified_date
        ) VALUES (
            :new.student_id,
            :new.salutation,
            :new.first_name,
            :new.last_name,
            :new.street_address,
            :new.zip,
            :new.phone,
            :new.employer,
            :new.registration_date,
            :new.created_by,
            :new.created_date,
            :new.modified_by,
            :new.modified_date
        );

    ELSIF "UPDATING" THEN
        UPDATE c##_63710_group_d.student
        SET
            created_by = :new.created_by,
            created_date = :new.created_date,
            employer = :new.employer,
            first_name = :new.first_name,
            last_name = :new.last_name,
            modified_by = :new.modified_by,
            modified_date = :new.modified_date,
            phone = :new.phone,
            registration_date = :new.registration_date,
            salutation = :new.salutation,
            street_address = :new.street_address,
            zip = :new.zip
        WHERE
            student_id = :new.student_id;

    ELSIF deleting THEN
        DELETE FROM c##_63710_group_d.student
        WHERE
            student_id = :old.student_id;

    END IF;
END;
/


-- Create procedure to avoid mutating table errors
create or replace PROCEDURE ALTER_TRG AS 
BEGIN
EXECUTE IMMEDIATE'ALTER TRIGGER TRG_IN_UP_DEL_COURSE ENABLE';
EXECUTE IMMEDIATE'ALTER TRIGGER C##_63710_GROUP_D.TRG_IN_UP_DEL_COURSE DISABLE';

EXECUTE IMMEDIATE'ALTER TRIGGER TRG_IN_UP_DEL_ENROLLMENT ENABLE';
EXECUTE IMMEDIATE'ALTER TRIGGER C##_63710_GROUP_D.TRG_IN_UP_DEL_ENROLLMENT DISABLE';

EXECUTE IMMEDIATE'ALTER TRIGGER TRG_IN_UP_DEL_SECTION ENABLE';
EXECUTE IMMEDIATE'ALTER TRIGGER C##_63710_GROUP_D.TRG_IN_UP_DEL_SECTION DISABLE';

EXECUTE IMMEDIATE'ALTER TRIGGER TRG_IN_UP_DEL_STUDENT ENABLE';
EXECUTE IMMEDIATE'ALTER TRIGGER C##_63710_GROUP_D.TRG_IN_UP_DEL_STUDENT DISABLE';

EXECUTE IMMEDIATE'ALTER TRIGGER TRG_IN_UP_DEL_ZIPCODE ENABLE';
EXECUTE IMMEDIATE'ALTER TRIGGER C##_63710_GROUP_D.TRG_IN_UP_DEL_ZIPCODE DISABLE';

END ALTER_TRG;

-- test triggers
SELECT * FROM COURSE ORDER BY COURSE_NO;

EXECUTE alter_trg;

Insert into COURSE (COURSE_NO,DESCRIPTION,COST,PREREQUISITE,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) values (2,'INTRO DATABASE SYSTEMS',2500,350,'DSCHERER',to_date('29-MAR-21','DD-MON-RR'),'ARISCHER',to_date('05-APR-21','DD-MON-RR'));
COMMIT;
/

update course set description = 'INTERMEDIATE DATABASE SYSTEMS' where course_no=2;
commit;
/

DELETE FROM COURSE WHERE COURSE_NO =2;
commit;
/

-- view enrollment
SELECT * FROM ENROLLMENT order by student_id;