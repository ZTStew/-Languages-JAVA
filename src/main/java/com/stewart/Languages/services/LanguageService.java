package com.stewart.Languages.services;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.stewart.Languages.models.Language;
import com.stewart.Languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository langRepo;
	
	public LanguageService(LanguageRepository langRepo) {
		this.langRepo = langRepo;
	}
	
	public void create(Language language) {
		langRepo.save(language);
	}
	
	public ArrayList<Language> findAll(){
		return (ArrayList<Language>) langRepo.findAll();
	}
	
	public Language findById(Long id) {
		return langRepo.findById(id).get();
	}
	
	public Language updateLang(Language lang) {
		langRepo.save(lang);
		return lang;
	}
	
	public void deleteLanguage(Long id) {
		langRepo.deleteById(id);
	}
	
	
}
