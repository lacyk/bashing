def replace(email, old_domain, new_domain):
    if old_domain in email:
        index = email.index(old_domain)
        new_email = email[:index] + new_domain
        return new_email
    return email


print(replace("my.old.email@old.domain", "old.domain", "new.domain"))
