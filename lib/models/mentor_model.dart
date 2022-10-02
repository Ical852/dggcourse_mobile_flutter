//@dart=2.9

class MentorModel {
  String id;
  String courseId;
  String img;
  String name;
  String job;
  String jobdesk;
  String about_job;
  String job_resp;
  String about_company;
  String job_history;

  MentorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    img = json['img'];
    name = json['name'];
    job = json['job'];
    jobdesk = json['jobdesk'];
    about_job = json['about_job'];
    job_resp = json['job_resp'];
    about_company = json['about_company'];
    job_history = json['job_history'];
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "courseId":courseId,
      "img":img,
      "name":name,
      "job":job,
      "jobdesk":jobdesk,
      "about_job":about_job,
      "job_resp":job_resp,
      "about_company":about_company,
      "job_history": job_history,
    };
  }
}