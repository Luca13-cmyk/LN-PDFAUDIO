

import streamlit as st
import PyPDF2
import os
import pyttsx3
import sys

convertingToAudio = "**Converting**..."


def resource_path(relative_path):
    """ Get absolute path to resource, works for dev and for PyInstaller """
    try:
        # PyInstaller creates a temp folder and stores path in _MEIPASS
        base_path = sys._MEIPASS2
    except Exception:
        base_path = os.path.abspath(".")

    return os.path.join(base_path, relative_path)


def read_pdf(file_path):
    with open(file_path, "rb") as f:
        pdf_reader = PyPDF2.PdfReader(f)
        num_pages = len(pdf_reader.pages)
        text = ""
        for page_num in range(num_pages):
            page_text = pdf_reader.pages[page_num].extract_text()
            clean_text = page_text.strip().replace('\n', ' ')
            text += clean_text
    return text

def text_to_audio(text, audio_file_path):
    engine = pyttsx3.init()
    engine.save_to_file(text, audio_file_path)
    engine.runAndWait()

def save_uploaded_file(uploaded_file):
    # Save the file to the 'uploads' folder
    file_path = os.path.join("uploads", uploaded_file.name)
    with open(file_path, "wb") as f:
        f.write(uploaded_file.getbuffer())

    return file_path


def main():
    global convertingToAudio
    st.title("PDF Converter to Audio")

    # File uploader
    uploaded_file = st.file_uploader("Choose a PDF file", type="pdf")

    if uploaded_file is not None:
        st.success("File successfully uploaded!")

        # Save the uploaded file to the disk
        file_path = save_uploaded_file(uploaded_file)

        # Display file content
        pdf_text = read_pdf(resource_path(file_path))


        # Convert text to audio
        audio_file_path = resource_path(os.path.join("uploads", "output.mp3"))
        st.markdown(convertingToAudio)
        text_to_audio(pdf_text, audio_file_path)
        convertingToAudio = "Text converted to audio!"
        st.success(convertingToAudio)

        # Provide a link-like button to the local audio file
        with open(resource_path(audio_file_path), 'rb') as f:
            st.download_button('Download Audio', f, file_name='output.mp3')


if __name__ == "__main__":
    main()
