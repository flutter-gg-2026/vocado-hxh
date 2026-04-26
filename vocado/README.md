
# 🎙️ VocaDo — Your AI Task Manager  
### *Transform Voice into Actionable Logic*

---

## 🧠 Project Overview

**VocaDo** is a mobile application that bridges voice input and task automation using Generative AI.  
Admins can record voice instructions, which are converted into structured tasks and assigned to users based on roles.

The system doesn’t just record speech — it understands and structures it into actionable data.

---
## ScreenRecord
https://github.com/user-attachments/assets/a0b8f555-3dfb-498f-99df-62e1253f13f3


## ✨ Key Features

### 🎤 Voice-to-Task AI
- Record voice instructions (Admin only)
- Convert speech to text using STT (Gladia API / Whisper)
- Parse text into structured JSON using Gemini 1.5 Flash

### 🧠 AI Output Example
```json
{
  "task": "Update the design in Figma",
  "assignee": "Rasha",
  "due_date": "2026-04-23"
}
````

---

## 👥 Role-Based Access Control (RBAC)

### Admin

* Record voice tasks
* Trigger AI processing
* Approve generated tasks

### User

* View assigned tasks
* Track task status

---

## 📊 Task Dashboard

* 🆕 New Tasks
* ⏳ In Progress Tasks
* 🔴 Late Tasks

---

## 🏗️ Architecture

```text
lib/
 ├── core/              # DI, networking, error handling
 ├── features/
 │   ├── auth/          # Login & RBAC logic
 │   ├── task_creator/  # Voice + AI pipeline (Admin)
 │   └── task_viewer/   # Task dashboard (User)
 └── main.dart
```

---

## ⚙️ Tech Stack

### Mobile

* Flutter
* Dart
* BLoC (State Management)
* GetIt (Dependency Injection)

### AI Pipeline

* Speech-to-Text: Gladia API / OpenAI Whisper
* LLM: Gemini 1.5 Flash
* Prompt Engineering (JSON structured output)

---

## 🚀 Project Roadmap

### Phase 1: Auth & Roles

* Login screen
* Role-based routing (Admin / User)
* Dashboard

### Phase 2: Voice Feature (Admin)

* Audio recording
* Mic animation (pulse effect)
* Error handling screen

### Phase 3: AI Processing

* Audio → STT
* Transcript → Gemini
* JSON → Task model
* Admin approval screen

### Phase 4: State Management (BLoC Flow)

```text
Recording → Transcribing → Parsing → Success / Error
```

---

## 🎨 UI Design

Figma Link:
[https://www.figma.com/design/orIarysJ6qilKJgHukQfgH/Untitled?node-id=0-1&t=oePpVXgvCfdIXwS2-1](https://www.figma.com/design/orIarysJ6qilKJgHukQfgH/Untitled?node-id=0-1&t=oePpVXgvCfdIXwS2-1)

---

## 🎯 Goal

To build an AI-powered task management system where voice becomes structured action automatically.

---

## ✨ Final Note

VocaDo demonstrates real-world integration of:

* AI + Mobile Development
* Clean Architecture
* Role-Based Systems
* Voice Processing Pipelines

````
